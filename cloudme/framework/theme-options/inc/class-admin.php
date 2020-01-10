<?php
/**
 * Theme Alien Options Framework
 * Theme options interfect
 *
 * @package Theme Alien Options Framework
 */

/**
 * Class to display admin options interfect
 *
 * @author Theme Alien
 * @version 1.0
 */
class CloudMe_Theme_Options_Admin {
	/**
	 * Setup the options
	 *
	 * @since  1.0
	 *
	 * @param  array $options Theme options fields
	 *
	 * @return CloudMe_Theme_Options_Admin
	 */
	public function __construct( $options ) {
		add_action( 'admin_menu', array( $this, 'admin_menu' ) );
		add_action( 'wp_ajax_theme_alien_options_save', array( $this, 'save' ) );
		add_action( 'wp_ajax_theme_alien_options_reset', array( $this, 'reset' ) );
		add_action( 'wp_ajax_theme_alien_options_import', array( $this, 'import' ) );
        add_action( 'wp_ajax_theme_alien_generate_custom_css', array( $this, 'custom_css' ) );
    }

	/**
	 * Add admin menu
	 *
	 * @since  1.0
	 *
	 * @return  void
	 */
	public function admin_menu() {
		$hook = add_theme_page( esc_html__( 'Theme Options', 'cloudme' ), esc_html__( 'Theme Options', 'cloudme' ), 'edit_theme_options', 'theme-options', array( $this, 'page' ) );

		add_action( "admin_print_styles-$hook", array( $this, 'enqueue' ) );
	}

	/**
	 * Enqueue scripts and styles for options page
	 *
	 * @since  1.0
	 *
	 * @return void
	 */
	public function enqueue() {
		wp_enqueue_media();
		wp_enqueue_style( 'wp-color-picker' );
		wp_enqueue_script( 'wp-color-picker' );

		/*Register Fonts*/
		function admin_theme_fonts_url() {
		    $fonts_url = '';
		    
		    $mon = _x( 'on', 'Roboto font: on or off', 'cloudme' );

		    if ( 'off' !== $mon ) {
		        $font_families = array();
		 
		        if ( 'off' !== $mon ) {
		            $font_families[] = 'Lato:300,400';
		        }
		 
		        $query_args = array(
		            'family' => urlencode( implode( '|', $font_families ) ),
		            'subset' => urlencode( 'latin,vietnamese,cyrillic,greek-ext,greek,cyrillic-ext,latin-ext' ),
		        );
		 
		        $fonts_url = add_query_arg( $query_args, 'https://fonts.googleapis.com/css' );
		    }
		 
		    return esc_url_raw( $fonts_url );

		}
		/*
		Enqueue scripts and styles.
		*/
		function cloudme_admin_theme_scripts() {
		    wp_enqueue_style( 'admin-fonts', admin_theme_fonts_url(), array(), '1.0.0' );
		}
		add_action( 'wp_enqueue_scripts', 'cloudme_admin_theme_scripts' );

		wp_enqueue_script( 'ace', '//cdnjs.cloudflare.com/ajax/libs/ace/1.1.9/ace.js', array(), '1.1.9', true );
		?>
		<script>window.ace || document.write( '<script src="<?php echo CLOUDME_OPTIONS_URL ?>js/ace.js" type="text/javascript"><\/script>' )</script>
		<?php
		wp_enqueue_style( 'alien-options', CLOUDME_OPTIONS_URL . 'css/admin.css' );
		wp_enqueue_script( 'alien-options', CLOUDME_OPTIONS_URL . 'js/admin.js', array( 'jquery', 'jquery-ui-datepicker', 'jquery-ui-sortable' ), '', true );
		wp_localize_script( 'alien-options', 'alienOptions', array(
			'nonce_save'        => wp_create_nonce( 'theme_alien_options_save' ),
			'nonce_reset'       => wp_create_nonce( 'theme_alien_options_reset' ),
			'nonce_import'      => wp_create_nonce( 'theme_alien_options_import' ),
			'nonce_css'         => wp_create_nonce( 'theme_alien_generate_custom_css' ),
			'reset_notice'      => esc_html__( 'This action can\'t be undo. Are you sure want to reset?', 'cloudme' ),
			'import_notice'     => esc_html__( 'All previous data will be overwritten and can\'t be undo. Are you sure want to import?', 'cloudme' ),
			'media_title'       => esc_html__( 'Select Image', 'cloudme' ),
			'media_title_multi' => esc_html__( 'Select Images', 'cloudme' ),
		) );
	}

	/**
	 * Render admin page
	 *
	 * @since  1.0
	 *
	 * @return void
	 */
	public function page() {
		$generator = new CloudMe_Theme_Options_Fields;
		$theme     = wp_get_theme();
		?>

		<div class="wrap">

			<div id="options-header" class="options-header">
				<a href="<?php echo esc_url( CloudMe_Theme_Options::$options['help']['support'] ); ?>" class="help" target="_blank"><i class="entypo-lifebuoy"></i><?php esc_html_e( 'Support', 'cloudme' ) ?>
				</a>
				<a href="<?php echo esc_url( CloudMe_Theme_Options::$options['help']['document'] ); ?>" class="help" target="_blank"><i class="entypo-book"></i><?php esc_html_e( 'Documentation', 'cloudme' ) ?>
				</a>

				<h1>
					<?php echo $theme->name ?> <?php esc_html_e( 'Theme Options', 'cloudme' ) ?>
					<span class="theme-version"><?php echo $theme->version ?></span>
					<span class="theme-author">
						<?php esc_html_e( ' by ', 'cloudme' ) ?>
						<a href="<?php echo esc_url( $theme->{'Author URI'} ); ?>" class="theme-author" target="_blank"><?php echo $theme->{'Author Name'} ?></a>
					</span>
				</h1>
			</div>

			<form method="POST" action="" id="theme-options" class="clearfix">
				<!-- Theme optons menu -->
				<div id="options-menu" class="options-menu">
					<ul class="menu">
						<?php
						foreach ( CloudMe_Theme_Options::$options['sections'] as $id => $menu ) {
							printf( '<li><span class="changes"></span><a href="#%s"><i class="entypo-%s"></i><span>%s</span></a></li>', $id, $menu['icon'], $menu['title'] );
						}
						?>
					</ul>
				</div>

				<!-- Theme optons content -->
				<div id="options-content" class="options-content clearfix">
					<div class="toolbar">
						<span class="toggle-menu entypo-menu"></span>
						<span class="quick-search">
							<input type="text" id="quick-search" placeholder="<?php esc_html_e( 'Quick Search', 'cloudme' ) ?>">
						</span>

						<button type="button" class="button reset-options"><?php esc_html_e( 'Reset Options', 'cloudme' ) ?></button>
						<button type="button" class="button button-primary save-options"><?php esc_html_e( 'Save Changes', 'cloudme' ) ?></button>
						<span class="spinner"></span>
					</div>

					<div id="options-sections" class="options-sections clearfix">
						<?php foreach ( CloudMe_Theme_Options::$options['fields'] as $section => $fields ): ?>
							<div id="<?php echo esc_attr( $section ); ?>" class="section">
								<?php echo $generator->generate( $fields ); ?>
							</div>
						<?php endforeach ?>
						<div class="options-back-content"></div>
					</div>
				</div>
			</form>
		</div>

		<div class="clear"></div>

	<?php
	}

	/**
	 * Ajax function to save theme options
	 *
	 * @since  1.0
	 *
	 * @return void
	 */
	public function save() {
		check_ajax_referer( 'theme_alien_options_save' );

		$_POST['data'] = stripslashes_deep( $_POST['data'] );
		parse_str( $_POST['data'], $data );

		foreach ( CloudMe_Theme_Options::$defaults as $name => $default ) {
			$value = isset( $data[$name] ) ? $data[$name] : '';
			set_theme_mod( $name, $value );
		}
		die;
	}

	/**
	 * Ajax function to reset theme options
	 *
	 * @since  1.0
	 *
	 * @return void
	 */
	public function reset() {
		check_ajax_referer( 'theme_alien_options_reset' );
		foreach ( CloudMe_Theme_Options::$defaults as $name => $default ) {
			remove_theme_mod( $name );
		}
		die;
	}

	/**
	 * Ajax function to import theme options
	 *
	 * @since  1.0
	 *
	 * @return void
	 */
	public function import() {
		check_ajax_referer( 'theme_alien_options_import' );
		$data = maybe_unserialize( $_POST['data'] );

		foreach ( $data as $name => $value ) {
			set_theme_mod( $name, $value );
		}
		die;
	}

    /**
     * Ajax function to generate custom css when options are saved
     * By default, it does nothing, just define a hook called 'theme_alien_generate_custom_css'.
     *
     * @since 1.0
     *
     * @return void
     */
    public function custom_css() {
        check_ajax_referer( 'theme_alien_generate_custom_css' );

        do_action( 'cloudme_ajax_generate_custom_css' );
        die;
    }
}
