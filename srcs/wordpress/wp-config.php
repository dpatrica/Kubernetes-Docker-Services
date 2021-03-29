<?php

define( 'DB_NAME', 'super_base' );
define( 'DB_USER', 'loser' );
define( 'DB_PASSWORD', 'kek' );
define( 'DB_HOST', 'mysql-svc' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );


define('AUTH_KEY',         'Fs*f8s76SGGlr0sjfah(38kw9(@j)-w=)9w9fklL;cz,WId');
define('SECURE_AUTH_KEY',  '*2(93hf`pfanalLdlsadsa8Hisao§hdso9fpfhlaf9safal');
define('LOGGED_IN_KEY',    'nsaclB7w8fbLWlfjs893asfn:92n*@(2-14nsa8lLdna91s');
define('NONCE_KEY',        '<>salzn~(dfb2bLb1fnsfJsfn*3lf0)snfa,<saasjfK;sa');
define('AUTH_SALT',        'sakKflalw378*Wfga01021n)SF0f3nfl)fskla-+=f-asnf');
define('SECURE_AUTH_SALT', 'fal`fh sand(*3poWdgapgbi aLfbafusdbyoGGFsyfyisa');
define('LOGGED_IN_SALT',   'dflkajngja;Gs;gjbdg;ja;jkbadsadgbjhLlhaLHvlhvla');
define('NONCE_SALT',       '@f77GFsyafg74kal,akzfabzagh;\qgasdg(bfksa;aeiYs');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __DIR__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );

?>