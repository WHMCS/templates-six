(function($) {
  "use strict";
	// Show/hide settings for post format when choose post format
	var $format = $( '#post-formats-select' ).find( 'input.post-format' ),
		$formatBox = $( '#format_detail' );

	$format.on( 'change', function() {
		var	type = $format.filter( ':checked' ).val();

		$formatBox.hide();
		if( $formatBox.find( '.rwmb-field' ).hasClass( type ) ) {
			$formatBox.show();
		}

		$formatBox.find( '.rwmb-field' ).slideUp();
		$formatBox.find( '.' + type ).slideDown();
	} );
	$format.filter( ':checked' ).trigger( 'change' );

})(jQuery);

