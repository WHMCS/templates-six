window.alien = window.alien || {};

(function ( $ ) {
	alien = {
		$wrap      : $( '#theme-options' ),
		$menu      : $( '#options-menu', alien.$wrap ),
		$sections  : $( '#options-sections', alien.$wrap ),
		$spinner   : $( '.spinner', alien.$wrap ),
		current    : null,
		inQuickView: false,

		frame: wp.media( {
			library: {
				type: 'image'
			},
			title  : alienOptions.media_title
		} ),

		frameMulti: wp.media( {
			library: {
				type: 'image'
			},
			title  : alienOptions.media_title_multi,
			multiple: true
		} ),

		/**
		 * Show spinner
		 *
		 * @return void
		 */
		showSpinner: function () {
			alien.$spinner.show().addClass( 'is-active' );
		},

		/**
		 * Hide spinner
		 *
		 * @return void
		 */
		hideSpinner: function () {
			alien.$spinner.hide().removeClass( 'is-active' );
		},

		/**
		 * Reset changes counter on menu
		 *
		 * @return void
		 */
		resetCounter: function () {
			alien.$menu.find( '.changes' ).not( ':empty' ).removeClass( 'active' ).text( '' );
			alien.$sections.find( '.changed' ).removeClass( 'changed' );
		},

		/**
		 * Change section whene menu item clicked
		 *
		 * @return void
		 */
		menu: function () {
			alien.$menu.on( 'click', 'a', function ( e ) {
				e.preventDefault();

				var $el = $( this ),
					$li = $el.parent(),
					$ul = $li.parent();

				if ( $li.hasClass( 'current' ) ) {
					return;
				}

				if ( alien.inQuickView ) {
					alien.$sections.children( '.section' ).children( '.field' ).show();
					alien.inQuickView = false;
				}

				alien.current = $el.attr( 'href' );
				$ul.find( 'li.current' ).removeClass( 'current' );

				$li.addClass( 'current' );

				// Show section content
				$( alien.current )
					.addClass( 'active' )
					.siblings().removeClass( 'active' );
			} );

			alien.$menu.find( 'a:eq(0)' ).trigger( 'click' );

			// Toggle menu
			alien.$wrap.on( 'click', '.toggle-menu', function ( e ) {
				e.preventDefault();

				alien.$wrap.toggleClass( 'minimized' );
			} );
		},

		/**
		 * Function to detect hand count the changes has been made
		 *
		 * @return void
		 */
		changes: function () {
			alien.$sections.on( 'change', 'input, textarea, select, .images-holder', function () {
				var $el = $( this );

				if ( alien.inQuickView || $el.hasClass( 'changed' ) ) {
					return;
				}

				var $counter = alien.$menu.find( 'li.current .changes' ),
					count = parseInt( $counter.text() );

				count = count ? count + 1 : 1;
				$counter.addClass( 'active' ).text( count );

				if ( 'radio' == $el.attr( 'type' ) ) {
					alien.$wrap.find( '.section.active' ).find( 'input[name=' + $el.attr( 'name' ) + ']' ).addClass( 'changed' );
				} else {
					$el.addClass( 'changed' );
				}
			} );
		},

		/**
		 * Call ajax functions
		 *
		 * @return void
		 */
		ajax: function () {
			alien.save();
			alien.reset();
			alien.restore();
		},

		/**
		 * Ajax function to save options
		 *
		 * @return void
		 */
		save: function () {
			alien.$wrap.on( 'click', '.save-options', function ( e ) {
				e.preventDefault();
				alien.showSpinner();

				$.post( ajaxurl, {
					action     : 'theme_alien_options_save',
					_ajax_nonce: alienOptions.nonce_save,
					data       : $( '#theme-options' ).serialize()
				}, function () {
					alien.hideSpinner();
					alien.resetCounter();
				} );

                // Call ajax function to generate custom css
                alien.generateCSS();
			} );
		},

		/**
		 * Ajax function to reset optons to default
		 *
		 * @return void
		 */
		reset: function () {
			alien.$wrap.on( 'click', '.reset-options', function ( e ) {
				e.preventDefault();

				if ( !confirm( alienOptions.reset_notice ) ) {
					return;
				}

				alien.showSpinner();

				$.post( ajaxurl, {
					'action'     : 'theme_alien_options_reset',
					'_ajax_nonce': alienOptions.nonce_reset
				}, function () {
					alien.hideSpinner();
					location.reload();
				} );

                // Call ajax function to generate custom css
                alien.generateCSS();
			} );
		},

		/**
		 * Ajax function to import options
		 *
		 * @return void
		 */
		restore: function () {
			alien.$wrap.on( 'click', '.import-options', function ( e ) {
				e.preventDefault();

				if ( !confirm( alienOptions.import_notice ) ) {
					return;
				}

				var data = $( this ).prev( 'textarea' ).val();

				if ( !data ) {
					return;
				}

				alien.showSpinner();

				$.post( ajaxurl, {
					action     : 'theme_alien_options_import',
					data       : data,
					_ajax_nonce: alienOptions.nonce_import
				}, function () {
					alien.hideSpinner();
					location.reload();
				} );

                // Call ajax function to generate custom css
                alien.generateCSS();
			} );
		},

        /**
         * Ajax function to generate custom CSS
         *
         * @return void
         */
        generateCSS: function () {
            $.post( ajaxurl, {
                action     : 'theme_alien_generate_custom_css',
                _ajax_nonce: alienOptions.nonce_css,
                data       : $( '#theme-options' ).serialize()
            } );
        },

		/**
		 * Init color picker
		 * We have to count changes here, backgroud preview as well.
		 *
		 * @return void
		 */
		color: function () {
			alien.$wrap.find( '.color' ).wpColorPicker( {
				change: function ( event, ui ) {
					var $input = $( event.target ),
						$background = $input.closest( '.field-background' );

					// Background preview
					if ( $background.length ) {
						$background.find( '.background-preview' ).css( 'background-color', ui.color.toString() );
					}

					// Count changes
					if ( alien.inQuickView || $input.hasClass( 'changed' ) ) {
						return;
					}

					var $counter = alien.$menu.find( '.menu li.current .changes' ),
						count = parseInt( $counter.text() );

					count = count ? count + 1 : 1;
					$counter.addClass( 'active' ).text( count );
					$input.addClass( 'changed' );
				}
			} );
		},

		/**
		 * Upload or remove single image
		 *
		 * @return void
		 */
		image: function () {
			// Init sortable for image field which enables multiple selection
			$( '.images-sort' ).sortable( {
				tolerance  : 'pointer',
				placeholder: 'image-placeholder'
			} );

			// Select or upload image(s)
			alien.$wrap.on( 'click', '.images-holder .button-select', function ( e ) {
				e.preventDefault();

				var $el = $( this ),
					$holder = $el.closest( '.images-holder' ),
					frame = alien.frame,
					multiple = $holder.hasClass( 'multiple' );

				if ( multiple ) {
					frame = alien.frameMulti;
				}

				// Remove all attached 'select' event
				frame.off( 'select' );

				// Update inputs when select image
				frame.on( 'select', function () {
					// Create inputs when multiple selection is enabled
					if ( multiple ) {
						var images = frame.state().get( 'selection' ).toJSON(),
							$sort = $holder.find( '.images-sort' );

						for( var i in images ) {
							$sort.append(
								'<div class="single-image">' +
									'<img src="' + images[i].sizes.thumbnail.url + '">' +
									'<i class="entypo-squared-minus button-clear">' +
									'<input type="hidden" name="' + $holder.data( 'name' ) + '[]" value="' + images[i].id + '">' +
								'</div>'
							);
						}

						$holder.addClass( 'has-image' ).trigger( 'change' );
						$sort.sortable( {
							tolerance  : 'pointer',
							placeholder: 'image-placeholder'
						} );
					}
					// Update input value for single image selection
					else {
						var url = frame.state().get( 'selection' ).first().toJSON().url;

						$el.siblings( 'img' ).attr( 'src', url );
						$el.siblings( 'input' ).val( url );
						$holder.addClass( 'has-image' ).trigger( 'change' );
					}
				} );

				frame.open();
			} );

			// Clear selected images
			alien.$wrap.on( 'click', '.images-holder .button-clear', function ( e ) {
				e.preventDefault();
				var $el = $( this ),
					$holder = $el.closest( '.images-holder' );

				// Remove image from a list
				if ( $holder.hasClass( 'multiple' ) ) {
					$el.closest( '.single-image' ).fadeOut( 200, function() {
						$( this ).remove();

						if ( $holder.find( '.images-sort' ).is( ':empty' ) ) {
							$holder.removeClass( 'has-image' );
						}
					} );

					$holder.trigger( 'change' );
				}
				// Remove single image
				else {
					$el.siblings( 'input' ).val( '' );
					$holder.removeClass( 'has-image' ).trigger( 'change' );
				}
			} );
		},

		/**
		 * Upload or remove icon
		 *
		 * @return void
		 */
		icon: function () {
			// Select icon from media library
			alien.$wrap.on( 'click', '.icon-picker .select', function ( e ) {
				e.preventDefault();

				var $el = $( this );

				// Remove all attached 'select' event
				alien.frame.off( 'select' );

				// Update inputs when select image
				alien.frame.on( 'select', function () {
					var url = alien.frame.state().get( 'selection' ).first().toJSON().url;
					$el.siblings( 'img' ).attr( 'src', url )
						.siblings( 'input' ).val( url ).trigger( 'change' )
						.parent().addClass( 'has-icon' );
				} );

				alien.frame.open();
			} );

			// Clear selected images
			alien.$wrap.on( 'click', '.icon-picker .remove', function ( e ) {
				e.preventDefault();
				$( this ).siblings( 'img' ).attr( 'src', '' )
					.siblings( 'input' ).val( '' ).trigger( 'change' )
					.parent().removeClass( 'has-icon' );
			} );
		},

		/**
		 * Preview background settings
		 *
		 * @return void
		 */
		background: function () {
			var $background = alien.$wrap.find( '.field-background' );

			// Select background image
			$background.on( 'click', '.button-select', function ( e ) {
				e.preventDefault();

				var $el = $( this ),
					$preview = $el.closest( '.background-preview' );

				// Remove all attached 'select' event
				alien.frame.off( 'select' );

				// Update inputs when select image
				alien.frame.on( 'select', function () {
					var url = alien.frame.state().get( 'selection' ).first().toJSON().url;

					$el.siblings( 'input' ).val( url ).trigger( 'change' );
					$preview.addClass( 'has-image' ).css( 'background-image', 'url(' + url + ')' );
				} );

				alien.frame.open();
			} );

			// Clear selected images
			$background.on( 'click', '.button-clear', function ( e ) {
				e.preventDefault();
				var $el = $( this ),
					$preview = $el.closest( '.background-preview' ),
					$patterns = $el.closest( '.input' ).find( '.background-patterns' );

				$el.siblings( 'input' ).val( '' ).trigger( 'change' );
				$preview.removeClass( 'has-image' ).css( 'background-image', '' );

				if ( $patterns.length ) {
					$patterns.children( '.pattern.active' ).removeClass( 'active' );
				}
			} );

			// Background pattern
			$background.find( '.background-patterns' ).on( 'click', '.pattern', function ( e ) {
				e.preventDefault();
				var $el = $( this );

				if ( $el.hasClass( 'active' ) ) {
					return;
				}

				$el.addClass( 'active' ).siblings().removeClass( 'active' );

				var $input = $el.closest( '.input' ),
					$preview = $input.find( '.background-preview ' ),
					$repeat = $input.find( '.background-repeat select' ),
					src = $el.children( 'img' ).attr( 'src' );

				$preview.css( {
					backgroundImage : 'url(' + src + ')',
					backgroundRepeat: 'repeat'
				} ).addClass( 'has-image' );
				$preview.children( 'input' ).val( src ).trigger( 'change' );
				$repeat.val( 'repeat' ).trigger( 'change' );
			} );

			// Background position
			$background.find( '.background-position' ).on( 'change', 'select', function () {
				var $el = $( this ),
					$holder = $el.closest( '.background-position' ),
					$preview = $holder.closest( '.field-background' ).find( '.background-preview' ),
					x = $holder.find( '.background-position-x select' ).val(),
					y = $holder.find( '.background-position-y select' ).val();

				$preview.css( 'background-position', x + ' ' + y );
			} );

			// Background repeat
			$background.find( '.background-repeat' ).on( 'change', 'select', function () {
				var $el = $( this ),
					$preview = $el.closest( '.field-background' ).find( '.background-preview' );

				$preview.css( 'background-repeat', $el.val() );
			} );

			// Background attachment
			$background.find( '.background-attachment' ).on( 'change', 'select', function () {
				var $el = $( this ),
					$preview = $el.closest( '.field-background' ).find( '.background-preview' );

				$preview.css( 'background-attachment', $el.val() );
			} );

			// Background size
			$background.find( '.background-size' ).on( 'change', 'select', function () {
				var $el = $( this ),
					$preview = $el.closest( '.field-background' ).find( '.background-preview' );

				$preview.css( 'background-size', $el.val() );
			} );

			// Background clear color
			$background.on( 'click', '.wp-picker-clear', function () {
				var $el = $( this ),
					$preview = $el.closest( '.field-background' ).find( '.background-preview' );

				$preview.css( 'background-color', '#fff' );
				$el.siblings( '.color' ).trigger( 'change' );
			} );
		},

		/**
		 * Add links to socials icons
		 *
		 * @return void
		 */
		social: function () {
			var $icons = alien.$sections.find( '#socials-inactived' ),
				$fields = alien.$sections.find( '#socials-actived' );

			$icons.on( 'click', '.active-social-link', function ( e ) {
				e.preventDefault();
				var $el = $( this );

				$el.addClass( 'hidden' );
				$fields.children( '#' + $el.data( 'social' ) ).remove().appendTo( $fields ).removeClass( 'hidden' ).addClass( 'active' );
			} );

			$fields.on( 'click', '.deactive-social-link', function ( e ) {
				e.preventDefault();
				var $input = $( this ).closest( '.social-link-input' );

				$input.removeClass( 'active' ).addClass( 'hidden' ).find( 'input' ).val( '' ).trigger( 'change' );
				$icons.children( '.entypo-' + $input.attr( 'id' ) ).removeClass( 'hidden' );
			} );
		},

		/**
		 * Change switcher ui state
		 *
		 * @return void
		 */
		switcher: function () {
			alien.$wrap.on( 'change', '.switcher input[type=checkbox]', function () {
				$( this ).closest( 'label' ).toggleClass( 'on' );
			} );
		},

		/**
		 * Change image toggle state
		 *
		 * @return void
		 */
		toggleImage: function () {
			alien.$wrap.on( 'change', '.field-image_toggle input', function () {
				$( this ).closest( 'label' ).addClass( 'active' ).siblings().removeClass( 'active' );
			} );
		},

		/**
		 * Change button group state
		 *
		 * @return void
		 */
		groupButtons: function () {
			alien.$wrap.on( 'change', '.button-group input', function () {
				var $label = $( this ).closest( 'label' ),
					$parent = $label.parent();
				if ( $parent.hasClass( 'multiple' ) ) {
					$label.toggleClass( 'active' );
				} else {
					$label.addClass( 'active' ).siblings().removeClass( 'active' );
				}
			} );
		},

		/**
		 * Code editor
		 *
		 * @return void
		 */
		codeEditor: function () {
			alien.$sections.find( '.code-editor' ).each( function () {
				var $el = $( this ),
					$textarea = $el.prev( 'textarea' ),
					editor;

				editor = ace.edit( this.id );
				editor.getSession().setMode( "ace/mode/" + $el.data( 'language' ) );
				editor.getSession().on( 'change', function () {
					$textarea.val( editor.getSession().getValue() ).trigger( 'change' );
				} );
			} );
		},

		/**
		 * Richtext editor
		 *
		 * @return void
		 */
		editor: function () {
			window.onload = function () {
				if ( typeof tinymce == 'undefined' ) {
					return;
				}

				for ( i in tinymce.editors ) {
					tinymce.editors[i].on( 'change', function ( e ) {
						e.target.save(); // Fix editor bug can't save by ajax
						$( '#' + e.target.id ).trigger( 'change' );
					} );
				}
			}
		},

		/**
		 * Code editor
		 *
		 * @return void
		 */
		date: function () {
			var $date = alien.$sections.find( '.datepicker' );

			$date.datepicker( {
				showOn    : 'both',
				buttonText: '<span class="entypo-calendar"></span>'
			} );
		},

		/**
		 * Change color scheme state
		 *
		 * @return void
		 */
		colorScheme: function () {
			alien.$wrap.on( 'change', '.field-color_scheme input', function () {
				$( this ).closest( 'label' ).addClass( 'active' ).siblings().removeClass( 'active' );
			} );
		},

		/**
		 * Quick search option field
		 *
		 * @return void
		 */
		quickSearch: function () {
			var $sections = alien.$sections.children( '.section' ),
				$fields = $sections.children( '.field' );

			alien.$wrap.on( 'keyup', '#quick-search', function ( e ) {
				var $el = $( this ),
					term = $el.val().toUpperCase();

				if ( !term ) {
					$sections.not( alien.current ).removeClass( 'active' );
					$sections.filter( alien.current ).addClass( 'active' );
					$fields.show();
					alien.inQuickView = false;
					return;
				}

				alien.inQuickView = true;
				$fields.hide();
				$sections.removeClass( 'active' );
				$fields.filter(function ( index ) {
					return $( this ).children( '.label' ).children( 'label' ).text().toUpperCase().indexOf( term ) > -1;
				} ).show().parent( '.section' ).addClass( 'active' );
			} );
		}
	};

	$( function () {
		alien.menu();
		alien.changes();
		alien.ajax();
		alien.color();
		alien.image();
		alien.icon();
		alien.background();
		alien.social();
		alien.switcher();
		alien.toggleImage();
		alien.colorScheme();
		alien.groupButtons();
		alien.codeEditor();
		alien.editor();
		alien.date();

		alien.quickSearch();
	} );
})( jQuery );
