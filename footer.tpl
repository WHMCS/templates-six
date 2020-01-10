
                </div><!-- /.main-content -->
                {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                    <div class="col-md-3 pull-md-left sidebar sidebar-secondary">
                        {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                    </div>
                {/if}
            <div class="clearfix"></div>
        </div>
    </div>
</section>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">{$LANG.close}</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body panel-body">
                {$LANG.loading}
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fas fa-circle-notch fa-spin"></i>
                    {$LANG.loading}
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    {$LANG.close}
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    {$LANG.submit}
                </button>
            </div>
        </div>
    </div>
</div>

{include file="$template/includes/generate-password.tpl"}

{$footeroutput}


<!-- content close -->

        
    <footer>
        <div class="containerx">
                        <div class="rowx">
                <div class="contacts">
                                        <div class="colx-sm-3 columns">
                        <i class="fa fa-map-marker"></i>
                        6026 Kalamazoo Ave SE, #288, Kentwood, MI 49508                    </div>
                                        <div class="colx-sm-3 columns">
                        <i class="fa fa-mobile"></i>
                        (877) 240-7767                    </div>
                                        <div class="colx-sm-3 columns">
                        <a href="mailto:sales@stream101.com"><i class="fa fa-envelope-o"></i></a>
                        E-MAIL US                    </div>
                                    </div>
            </div>
                        <div class="rowx">
                <div class="footerlinks">
         
<div class="colx-md-3 colx-sm-6 columns">



    <div id="text-3" class="widget widget_text"><h2>Streaming Services</h2>			<div class="textwidget"><ul>
<li><a href="https://www.stream101.com/economy-streaming/">Economy Streaming</a></li>
<li><a href="https://www.stream101.com/premium-shoutcast-hosting/">SHOUTcast Hosting</a></li>
<li><a href="https://www.stream101.com/premium-icecast-hosting/">ICEcast Hosting</a></li>
</ul></div>
		</div>


</div><!-- end col-lg-3 -->

<div class="colx-md-3 colx-sm-6 columns">



    <div id="text-6" class="widget widget_text"><h2>Hosting Services</h2>			<div class="textwidget"><ul>
<li><a href="https://www.stream101.com/domains/">Domain Registrations</a></li>
<li><a href="https://www.stream101.com/cpanel-cloud-hosting/">cPanel Cloud Hosting</a></li>
<li><a href="https://www.stream101.com/wordpress-hosting/">WordPress Hosting</a></li>
</ul></div>
		</div>


</div><!-- end col-lg-3 -->

<div class="colx-md-3 colx-sm-6 columns">



    <div id="text-4" class="widget widget_text"><h2>Company</h2>			<div class="textwidget"><ul>
<li><a href="https://www.stream101.com/about-us/">About us</a></li>
<li><a href="https://www.stream101.com/blog/">News</a></li>
<li><a href="https://www.stream101.com/support/">Support</a></li>
<li><a href="https://www.stream101.com/affiliate-program/">Affiliates</a></li>
<li><a href="https://www.stream101.com/contact/">Contact Us</a></li>
</ul></div>
		</div>


</div><!-- end col-lg-3 -->

<div class="colx-md-3 colx-sm-6 columns">



    <div id="text-7" class="widget widget_text"><h2>Download FREE Report</h2>			<div class="textwidget"><ul>
<li><a href="https://www.stream101.com/radio-station-business/">Build a Profitable Radio Station in 30 days or less. Download this Step-by-Step Guide today!</a></li>
</ul>

<a href="https://www.stream101.com/radio-station-business/" target="_blank">
<img src="https://www.stream101.com/wp-content/uploads/2017/05/Download-Button.png" alt="" class="auto-style1"/></a></div>
		</div>


</div><!-- end col-lg-3 -->

                </div>
            </div>
            <!--SOCIAL LINKS -->
            <div class="social">
                <div class="rowx">
                    <div class="small-12 columns">
                        <ul class="small-block-grid-1 large-block-grid-5 medium-block-grid-5">

                            <li class="facebook"><a href="https://www.facebook.com/stream101" class="bb-facebook" target="_blank">facebook</a></li>
	<li class="twitter"><a href="https://twitter.com/stream101" class="bb-twitter" target="_blank">twitter</a></li>
	<li class="googleplus"><a href="https://plus.google.com/+Stream101" class="bb-google+" target="_blank">google+</a></li>
	<li class="youtube"><a href="https://www.youtube.com/stream101com" class="bb-youtube" target="_blank">youtube</a></li>                    
                        </ul>
                    </div>
                </div>
            </div>
            <!-- END OF SOCIAL LINKS -->
        </div>

        <p class="copyright">© Copyright 2010-2018 - Stream101, All Rights Reserved.
<a href="https://www.stream101.com/acceptable-use-policy/">Acceptable Use Policy</a> | <a href="https://www.stream101.com/terms-of-service/">Terms of Service</a> | <a href="https://www.stream101.com/privacy-statement/">Privacy Statement</a> | <a href="https://www.stream101.com/refund-policy/">Refund Policy</a> | <a href="https://www.stream101.com/service-level-agreement/">Service Level Agreement</a></p>
    </footer>
    <a href="#toptop" id="back-to-top"><i class="fa fa-angle-up"></i></a>



<script type='text/javascript' src='{$WEB_ROOT}/templates/{$template}/cloudme/js/vendor/morphext.min.js?ver=4.9.6'></script>
<script type='text/javascript' src='{$WEB_ROOT}/templates/{$template}/cloudme/js/vendor/superfish.min.js?ver=4.9.6'></script>
<script type='text/javascript' src='{$WEB_ROOT}/templates/{$template}/cloudme/js/vendor/jquery.slicknav.min.js?ver=4.9.6'></script>

<script type='text/javascript' src='{$WEB_ROOT}/templates/{$template}/cloudme/js/custom.js?ver=4.9.6'></script>


</body>
</html>
