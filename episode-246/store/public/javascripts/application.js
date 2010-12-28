if (history && history.pushState) {
  $(function() {
    $("#products th a, #products .pagination a").live("click", function() {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      return false;
    });
    $("#products_search input").keyup(function() {
      $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
      history.replaceState(null, document.title, $("#products_search").attr("action") + "?" + $("#products_search").serialize());
      return false;
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}