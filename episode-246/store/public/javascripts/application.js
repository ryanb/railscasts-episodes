if (history && history.pushState) {
  $(function(e) {
    $("#products th a, #products .pagination a").live("click", function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    $("#products_search input").keyup(function() {
      $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
      history.replaceState(null, document.title, $("#products_search").attr("action") + "?" + $("#products_search").serialize());
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}