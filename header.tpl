<!DOCTYPE html>
<html lang="en">
<head>
    {literal}
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-M32X55R');</script>
    <!-- End Google Tag Manager -->
    {/literal}
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<body data-phone-cc-input="{$phoneNumberInputStyle}" class="my-hostme">
{literal}
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M32X55R"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
{/literal}

{$headeroutput}



<header id="masthead" class="site-header header-style-solid">
        <div class="container">
            <div class="site-branding">
                <a href="https://www.123host.me">
                    <svg width="236px" height="60px" viewBox="0 0 236 60" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <g id="123hostme-logo" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(-140.000000, -34.000000)">
                            <g id="logo" transform="translate(140.000000, 34.000000)">
                                <path d="M23.9937586,54.7884345 C23.6705517,55.4460552 23.1102069,55.9382621 22.4162759,56.1749517 C21.7241379,56.4089517 20.9804483,56.3618828 20.3228276,56.0386759 C19.6652069,55.715469 19.1734483,55.1560207 18.9376552,54.4625379 C18.7009655,53.7699517 18.7493793,53.0253655 19.0721379,52.3686414 C19.3953448,51.7110207 19.9552414,51.2197103 20.6487241,50.983469 C20.9401034,50.8839517 21.2382069,50.837331 21.530931,50.837331 C22.6722414,50.837331 23.7404828,51.5563655 24.1286897,52.6949862 C24.364931,53.388469 24.3169655,54.1312621 23.9937586,54.7884345 M19.4643793,47.5035034 C17.8407241,48.055331 16.5304138,49.2082966 15.7737241,50.7467793 C15.0170345,52.2852621 14.9049655,54.0259172 15.4576897,55.6486759 C16.0104138,57.2705379 17.1615862,58.5812966 18.7005172,59.3375379 C19.5952759,59.7786414 20.5586207,60.0000897 21.5273448,60.0000897 C22.2239655,60.0000897 22.9232759,59.8848828 23.6024138,59.6535724 C25.2256207,59.1012966 26.5354828,57.9501241 27.2917241,56.4111931 C28.0488621,54.8722621 28.160931,53.1325034 27.6082069,51.5092966 C26.4677931,48.1597793 22.8121034,46.3635379 19.4643793,47.5035034" id="Fill-1" fill="#941AE5"></path>
                                <path d="M14.8354713,40.3797039 C14.1997373,41.6724868 13.0990705,42.6393971 11.7363844,43.1049292 C8.91979424,44.0648566 5.85328521,42.551877 4.89456482,39.7395972 C4.43009737,38.3755879 4.52457322,36.9128859 5.15984182,35.620103 C5.79557582,34.3277857 6.89624267,33.3599443 8.25985953,32.8962743 C8.82997238,32.7012163 9.41730497,32.6048512 10.0018452,32.6048512 C10.8162921,32.6048512 11.6251542,32.7919951 12.3767724,33.1616276 C13.6691833,33.7970791 14.6362809,34.8985282 15.1002829,36.2616064 L15.1007483,36.2616064 C15.5647504,37.6251501 15.4712053,39.0883177 14.8354713,40.3797039 M18.9686731,42.4126829 C20.1470615,40.0170544 20.3220512,37.3043984 19.4605991,34.7756277 C17.6827778,29.5570121 11.9914227,26.7577671 6.77477373,28.5342379 C1.55626321,30.3121052 -1.24264183,36.0055637 0.534714063,41.2251103 C1.94999013,45.3785884 5.84444264,48 10.0064991,48 C11.0727265,48 12.156639,47.8277531 13.2205394,47.4651035 C15.7485827,46.603869 17.7902848,44.8106391 18.9686731,42.4126829" id="Fill-4" fill="#941AE5"></path>
                                <path d="M34.7569641,19.3093546 C33.6067957,21.6495678 31.6141266,23.4014876 29.1472328,24.2425017 C24.053828,25.9786844 18.4973024,23.2441157 16.7618713,18.1475795 C15.9212212,15.6791546 16.0924048,13.0311404 17.2430359,10.6904644 C18.3932043,8.3502513 20.3858734,6.59879431 22.8532299,5.75778021 C23.8858831,5.40600767 24.9486091,5.23104711 26.0085592,5.23104711 C27.4816631,5.23104711 28.9464391,5.5689339 30.307117,6.23869031 C32.6463172,7.38981968 34.3974787,9.38335172 35.2381287,11.8517767 C36.0787788,14.3202017 35.9075952,16.9691415 34.7569641,19.3093546 M21.1659152,0.802415915 C17.3753561,2.09379144 14.3144091,4.78485141 12.5470546,8.37987425 C10.7797,11.9753599 10.5169101,16.0434243 11.808652,19.8360877 C13.9299401,26.0675532 19.7705379,30 26.0131858,30 C27.6121327,30 29.2383765,29.7417249 30.8340848,29.197866 C34.6246439,27.9060276 37.6855909,25.2149677 39.4529454,21.619482 C41.2203,18.0239963 41.4830899,13.9559319 40.191348,10.1632685 C37.5255111,2.33494078 28.9903916,-1.86457541 21.1659152,0.802415915" id="Fill-6" fill="#941AE5"></path>
                                <path d="M105.177603,39.2567045 C103.791911,39.2567045 102.26765,39.6225702 100.881488,40.307813 L100.881488,26.8684081 C100.881488,26.4114246 100.46578,26 100.00404,26 L94.8774484,26 C94.4152379,26 94,26.4114246 94,26.8684081 L94,57.1311271 C94,57.5885754 94.4152379,58 94.8774484,58 L99.8659402,58 C100.650853,58 100.881488,57.7257169 100.881488,57.1311271 L100.881488,48.7650289 C100.881488,45.9766395 102.498285,45.1551849 103.976514,45.1551849 C106.009488,45.1551849 107.348678,46.7543946 107.348678,48.7650289 L107.348678,57.1311271 C107.348678,57.5885754 107.718352,58 108.226126,58 L113.122082,58 C113.584292,58 114,57.5885754 114,57.1311271 L114,48.8570764 C114,43.782375 110.99751,39.2567045 105.177603,39.2567045" id="Fill-8" fill="#000000"></path>
                                <path d="M126.500232,53.1636482 C124.490478,53.1636482 122.891779,51.4891531 122.891779,49.4544574 C122.891779,47.4634642 124.490478,45.8363518 126.500232,45.8363518 C128.509522,45.8363518 130.108686,47.4634642 130.108686,49.4544574 C130.108686,51.4891531 128.509522,53.1636482 126.500232,53.1636482 M126.500232,40 C121.293544,40 117,44.3426468 117,49.4544574 C117,54.6564331 121.293544,59 126.500232,59 C131.707385,59 136,54.6564331 136,49.4544574 C136,44.3426468 131.707385,40 126.500232,40" id="Fill-10" fill="#000000"></path>
                                <path d="M145.931261,46.9215534 C144.424213,46.3778025 143.936732,45.9255968 143.936732,45.4733911 C143.936732,44.9756428 144.336358,44.8408552 144.912145,44.8408552 C146.639055,44.8408552 148.677286,45.8809743 148.677286,45.8809743 C149.032761,46.017142 149.475639,45.8809743 149.607646,45.6090988 L151.247602,42.533824 C151.51387,42.0816183 151.202549,41.6740352 150.804274,41.4030798 C149.82886,40.7691637 147.702774,40 144.912145,40 C140.126987,40 138,42.4422788 138,45.4733911 C138,48.2781705 139.507498,50.3133262 142.96267,51.5351557 C145.222115,52.349862 145.487031,52.983778 145.487031,53.4355237 C145.487031,53.9783546 145.088756,54.2488499 144.645878,54.2488499 C142.741456,54.2488499 140.658621,53.0739432 140.658621,53.0739432 C140.304048,52.8922328 139.86072,53.1636482 139.729163,53.4355237 L138.177512,56.555421 C137.956298,56.9634642 138.177512,57.2353397 138.487932,57.5058351 C139.373238,58.2299162 141.588981,59 144.512969,59 C149.519341,59 152,56.4210934 152,53.2542734 C152,49.6347877 149.519341,48.1880054 145.931261,46.9215534" id="Fill-12" fill="#000000"></path>
                                <path d="M167.946883,53.0741403 C167.807582,52.5647433 167.384431,52.379722 166.915483,52.4710557 C166.446535,52.5647433 165.743351,52.7959022 165.085965,52.7959022 C164.523036,52.7959022 163.819852,52.7022146 163.819852,51.6857745 L163.819852,45.897857 L167.290928,45.897857 C167.807582,45.897857 168.181596,45.4816768 168.181596,45.019359 L168.181596,40.8980453 C168.181596,40.3881775 167.807582,40.0190765 167.290928,40.0190765 L163.819852,40.0190765 L163.819852,34.8799104 C163.819852,34.416651 163.444408,34 162.975459,34 L157.95633,34 C157.486905,34 157.064231,34.416651 157.064231,34.8799104 L157.064231,40.0190765 L155.845824,40.0190765 C155.374968,40.0190765 155,40.3881775 155,40.8980453 L155,45.019359 C155,45.4816768 155.374968,45.897857 155.845824,45.897857 L157.064231,45.897857 L157.064231,52.5647433 C157.064231,56.7764491 159.128939,59 162.693041,59 C165.03969,59 168.370034,57.9807352 168.370034,57.9807352 C168.838982,57.8427931 169.073218,57.3333961 168.979714,56.9158035 L167.946883,53.0741403 Z" id="Fill-14" fill="#000000"></path>
                                <path d="M175.452069,50 C173.036236,50 171,52.0828516 171,54.5462428 C171,56.9619461 173.036236,59 175.452069,59 C177.915592,59 180,56.9619461 180,54.5462428 C180,52.0828516 177.915592,50 175.452069,50" id="Fill-16" fill="#000000"></path>
                                <path d="M205.665425,40 C202.600845,40 200.482033,41.7610745 199.447371,42.82705 C197.82527,40.9740811 196.066161,40 193.543198,40 C190.660532,40 188.588001,41.66918 187.460778,42.8741753 L186.695091,40.9740811 C186.559916,40.6955702 186.24466,40.4637135 185.928488,40.4637135 L183.855498,40.4637135 C183.36062,40.4637135 183,40.8336475 183,41.3440151 L183,58.1192271 C183,58.5829406 183.36062,59 183.855498,59 L188.588001,59 C189.038431,59 189.443498,58.5829406 189.443498,58.1192271 L189.443498,49.2219604 C189.443498,47.3218662 190.794791,45.9792648 192.596515,45.9792648 C194.625057,45.9792648 195.436108,47.600377 195.436108,49.4538172 L195.436108,58.1192271 C195.436108,58.5829406 195.796727,59 196.291606,59 L200.617667,59 C201.113461,59 201.474539,58.5829406 201.474539,58.1192271 L201.474539,49.128181 C201.474539,47.3218662 202.915643,45.9792648 204.493297,45.9792648 C206.566287,45.9792648 207.512512,47.600377 207.512512,49.4538172 L207.512512,58.1192271 C207.512512,58.5829406 207.871757,59 208.36801,59 L213.143127,59 C213.63938,59 214,58.5829406 214,58.1192271 L214,49.7318567 C214,44.4486334 211.251593,40 205.665425,40" id="Fill-18" fill="#000000"></path>
                                <path d="M224.415368,46.4968837 C224.602992,45.3071163 225.676968,44.3466512 226.938568,44.3466512 C228.152193,44.3466512 229.320693,45.3071163 229.412843,46.4968837 L224.415368,46.4968837 Z M227.125242,39.4522326 C221.613817,39.4522326 217.455668,43.8894419 217.455668,49.057814 C217.455668,54.3164186 221.660368,58.6624651 227.217867,58.6624651 C230.160493,58.6624651 232.496543,57.6554884 234.130542,56.0554884 C234.551867,55.6443256 234.457818,55.094093 234.178043,54.7285116 L231.841993,51.9838605 C231.561267,51.6647907 231.094342,51.6647907 230.674443,51.9838605 C229.927267,52.5336279 228.573042,53.0815349 227.405968,53.0815349 C224.976818,53.0815349 223.948442,51.297814 223.809268,50.0633953 L235.018792,50.0633953 C235.438693,50.0633953 235.858593,49.7433953 235.905143,49.2866512 C235.952642,48.9657209 236.000143,48.3717674 236.000143,48.0508372 C236.000143,43.0196744 231.889017,39.4522326 227.125242,39.4522326 Z" id="Fill-20" fill="#000000"></path>
                                <path d="M50.5765699,36 L47.6646519,36 L47.3855027,36 L47.1598763,36.1655181 L42.5393808,39.5662894 L42.4964703,39.5978167 L42.4577124,39.634444 C42.1965579,39.8820257 42,40.34288 42,40.7059071 L42,42.5854882 C42,43.3708879 42.6385826,44.0107058 43.4238915,44.0107058 L45.6077147,44.0107058 L45.6077147,56.5747824 C45.6077147,57.3606457 46.2606007,58 47.063443,58 L50.5765699,58 C51.3618788,58 52,57.3606457 52,56.5747824 L52,37.4252176 C52,36.6393543 51.3618788,36 50.5765699,36" id="Fill-23" fill="#000000"></path>
                                <path d="M69.6210214,46.0523755 C70.4292587,44.606903 71,43.584094 71,41.791891 C71,37.792598 67.6375077,35 62.8228167,35 C58.6478629,35 55.8495409,38.0414388 55.732201,38.1713484 C55.4773387,38.437114 55.3370002,38.8195239 55.3646924,39.203306 C55.3909766,39.5623869 55.5618235,39.8967668 55.8359295,40.1273105 L57.7804864,41.9341512 C58.0728974,42.2008317 58.4436915,42.3444641 58.8309132,42.3444641 C59.2181349,42.3444641 59.588929,42.2003743 59.8757077,41.9396403 C60.4605298,41.3495582 61.446185,40.696351 62.4046173,40.696351 C63.5606501,40.696351 64.368418,41.2196486 64.368418,41.9680008 C64.368418,42.4739162 64.1196574,43.1129431 63.6864384,43.7217798 C61.8610989,46.2669092 57.1510751,52.1279343 55.1952536,54.4699657 L55,54.7037114 L55,55.004699 L55,55.5934089 C55,56.3692068 55.6641439,57 56.4803602,57 L69.3581801,57 C70.1612544,57 70.839479,56.3554839 70.839479,55.5934089 L70.839479,52.9444433 C70.839479,52.1828257 70.1612544,51.538767 69.3581801,51.538767 L65.4620259,51.538767 C65.5737335,51.3987941 65.6877878,51.2569914 65.802781,51.1129015 C67.2277568,49.3348789 68.8428232,47.3199085 69.6210214,46.0523755" id="Fill-25" fill="#000000"></path>
                                <path d="M86.9355589,46.1467673 C88.2860694,45.100991 89.4255916,43.4252006 89.4255916,41.4299198 C89.4255916,37.7640396 86.0957887,35 81.6799078,35 C77.8909499,35 75.0983769,37.8107598 74.9812645,37.9301557 C74.7033549,38.1939594 74.5393046,38.5917886 74.5523171,39.0004719 C74.5653296,39.3921661 74.7451808,39.7602643 75.046327,40.0108542 L76.9526565,41.7989618 C77.2649563,42.0608778 77.6102519,42.1859368 77.9629833,42.1859368 C78.3677647,42.1859368 78.7553509,42.0169891 79.0258248,41.7225106 C79.6011627,41.1019349 80.3238205,40.785748 81.170097,40.785748 C82.1018842,40.785748 82.8598616,41.4152902 82.8598616,42.1887683 C82.8598616,43.0783388 81.8588295,43.6531383 80.3094139,43.6531383 L78.5243793,43.6531383 C77.7162108,43.6531383 77.0581506,44.3039169 77.0581506,45.1033506 L77.0581506,47.6238792 C77.0581506,48.4100991 77.729688,49.0740916 78.5243793,49.0740916 L80.3094139,49.0740916 C82.2143492,49.0740916 83.2423358,49.8914582 83.2423358,50.6597452 C83.2423358,51.4445493 82.2947478,52.2147239 81.3295,52.2147239 C80.3019782,52.2147239 78.8041478,51.3194903 78.3143205,50.9740444 C78.0624359,50.7951864 77.7664018,50.6989146 77.4606083,50.6989146 C77.0837109,50.6989146 76.7202907,50.8461538 76.4381985,51.1142048 L74.4291632,53.0278433 L74.4049972,53.0509674 L74.3826901,53.0759792 C73.8854271,53.6285984 73.8710204,54.4789995 74.3496941,55.0127419 C74.9013307,55.69042 77.1431966,58 81.7119742,58 C86.514512,58 90,55.1939594 90,51.3279849 C90,49.005663 88.4538375,47.190184 86.9355589,46.1467673" id="Fill-27" fill="#000000"></path>
                            </g>
                        </g>
                    </svg>
                </a>
            </div><!-- .site-branding -->

            <nav id="site-navigation" class="main-navigation">
                <button class="menu-toggle" aria-controls="primary-menu" aria-expanded="false">
                    <svg width="31px" height="23px" viewBox="0 0 31 23" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <g id="hamburger" transform="translate(-1269.000000, -69.000000)" stroke="#FFFFFF">
                            <path d="M1270,71 L1270,70 L1298.71896,70 L1298.71896,71 L1270,71 Z M1270,81 L1270,80 L1298.71896,80 L1298.71896,81 L1270,81 Z M1270,91 L1270,90 L1298.71896,90 L1298.71896,91 L1270,91 Z" id="Combined-Shape"></path>
                        </g>
                    </svg>
                </button>
                <div class="menu-main-menu-container">
                    <ul id="primary-menu" class="menu nav-menu" aria-expanded="false">
                        <li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-32 current_page_item menu-item-44"><a href="https://www.123host.me/our-products/">Our Products</a></li>
<li id="menu-item-45" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-45"><a href="https://www.123host.me/pricing/">Pricing</a></li>
<li id="menu-item-63" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-63"><a href="https://my.123host.me/knowledgebase">Get Help</a></li>
<li id="menu-item-64" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-64"><a href="https://my.123host.me/knowledgebase/1/Getting-Started">Get Started</a></li>
</ul></div>             
            {if $loggedin}
            <a class="my-account-button" href="{$WEB_ROOT}/clientarea.php">My Account</a>
            {else}
             <a class="my-account-button" href="{$WEB_ROOT}/clientarea.php">{$LANG.login}</a>
            {/if}
            </nav><!-- #site-navigation -->
        </div>
    </header>

{if $templatefile == 'homepage'}
    <section id="home-banner">
        <div class="container text-center">
            {if $registerdomainenabled || $transferdomainenabled}
                <h2>{$LANG.homebegin}</h2>
                <form method="post" action="domainchecker.php">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" name="domain" placeholder="{$LANG.exampledomain}" autocapitalize="none" />
                                <span class="input-group-btn">
                                    {if $registerdomainenabled}
                                        <input type="submit" class="btn search" value="{$LANG.search}" />
                                    {/if}
                                    {if $transferdomainenabled}
                                        <input type="submit" name="transfer" class="btn transfer" value="{$LANG.domainstransfer}" />
                                    {/if}
                                </span>
                            </div>
                        </div>
                    </div>

                    {include file="$template/includes/captcha.tpl"}
                </form>
            {else}
                <h2>{$LANG.doToday}</h2>
            {/if}
        </div>
    </section>
    <div class="home-shortcuts">
        <div class="container">
            <div class="row">
                <div class="col-md-4 hidden-sm hidden-xs text-center">
                    <p class="lead">
                        {$LANG.howcanwehelp}
                    </p>
                </div>
                <div class="col-sm-12 col-md-8">
                    <ul>
                        {if $registerdomainenabled || $transferdomainenabled}
                            <li>
                                <a id="btnBuyADomain" href="domainchecker.php">
                                    <i class="fas fa-globe"></i>
                                    <p>
                                        {$LANG.buyadomain} <span>&raquo;</span>
                                    </p>
                                </a>
                            </li>
                        {/if}
                        <li>
                            <a id="btnOrderHosting" href="cart.php">
                                <i class="far fa-hdd-o"></i>
                                <p>
                                    {$LANG.orderhosting} <span>&raquo;</span>
                                </p>
                            </a>
                        </li>
                        <li>
                            <a id="btnMakePayment" href="clientarea.php">
                                <i class="fas fa-credit-card"></i>
                                <p>
                                    {$LANG.makepayment} <span>&raquo;</span>
                                </p>
                            </a>
                        </li>
                        <li>
                            <a id="btnGetSupport" href="submitticket.php">
                                <i class="far fa-envelope-o"></i>
                                <p>
                                    {$LANG.getsupport} <span>&raquo;</span>
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
{/if}

{include file="$template/includes/verifyemail.tpl"}

<section id="main-body">
    <div class="container{if $skipMainBodyContainer}-fluid without-padding{/if}">
        <div class="row">

        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
            {if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
                <div class="col-md-9 pull-md-right">
                    {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
                </div>
            {/if}
            <div class="col-md-3 pull-md-left sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
            </div>
        {/if}
        <!-- Container for main page display content -->
        <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-9 pull-md-right{else}col-xs-12{/if} main-content">
            {if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
                {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
            {/if}
