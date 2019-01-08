
                </div><!-- /.main-content -->
                {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                    <div class="col-md-3 pull-md-left sidebar">
                        {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                    </div>
                {/if}
            <div class="clearfix"></div>
        </div>
    </div>
</section>

<section id="footer">
    <div class="container">
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        <p>Copyright &copy; {$date_year} {$companyname}. All Rights Reserved.</p>
    </div>
</section>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">Title</h4>
            </div>
            <div class="modal-body panel-body">
                Loading...
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fa fa-circle-o-notch fa-spin"></i> Loading...
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>

{literal}
<script>
function findByTextContent(needle, haystack, precise) {
  // needle: String, the string to be found within the elements.
  // haystack: String, a selector to be passed to document.querySelectorAll(),
  //           NodeList, Array - to be iterated over within the function:
  // precise: Boolean, true - searches for that precise string, surrounded by
  //                          word-breaks,
  //                   false - searches for the string occurring anywhere
  var elems;

  // no haystack we quit here, to avoid having to search
  // the entire document:
  if (!haystack) {
    return false;
  }
  // if haystack is a string, we pass it to document.querySelectorAll(),
  // and turn the results into an Array:
  else if ('string' == typeof haystack) {
    elems = [].slice.call(document.querySelectorAll(haystack), 0);
  }
  // if haystack has a length property, we convert it to an Array
  // (if it's already an array, this is pointless, but not harmful):
  else if (haystack.length) {
    elems = [].slice.call(haystack, 0);
  }

  // work out whether we're looking at innerText (IE), or textContent 
  // (in most other browsers)
  var textProp = 'textContent' in document ? 'textContent' : 'innerText',
    // creating a regex depending on whether we want a precise match, or not:
    reg = precise === true ? new RegExp('\\b' + needle + '\\b') : new RegExp(needle),
    // iterating over the elems array:
    found = elems.filter(function(el) {
      // returning the elements in which the text is, or includes,
      // the needle to be found:
      return reg.test(el[textProp]);
    });
  return found.length ? found : false;;
}

findByTextContent('Powered by WHMCompleteSolution', 'p').forEach(function(elem) {
  elem.style.display = 'none';
});

</script>
<script type="text/javascript" src="https://www.123host.me/wp-content/themes/123hostme-theme/js/navigation.js"></script>
<script>(function(d,a){function c(){var b=d.createElement("script");b.async=!0;b.type="text/javascript";b.src=a._settings.messengerUrl;b.crossOrigin="anonymous";var c=d.getElementsByTagName("script")[0];c.parentNode.insertBefore(b,c)}window.kayako=a;a.readyQueue=[];a.newEmbedCode=!0;a.ready=function(b){a.readyQueue.push(b)};a._settings={apiUrl:"https://123hostme.kayako.com/api/v1",messengerUrl:"https://123hostme.kayakocdn.com/messenger",realtimeUrl:"wss://kre.kayako.net/socket"};window.attachEvent?window.attachEvent("onload",c):window.addEventListener("load",c,!1)})(document,window.kayako||{});</script>
{/literal}

{$footeroutput}

</body>
</html>
