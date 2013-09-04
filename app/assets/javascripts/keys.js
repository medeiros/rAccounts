
$.register_new_web_account_on_ctrlkey = function(path) {
  $.register_redirect_on_ctrlkey('N', path);
}

$.register_redirect_on_ctrlkey = function(key, path) {
  $.ctrl(key, function(e) {
    window.location.href = e;
  }, [path]);
};

$.ctrl = function(key, callback, args) {
  var isCtrl = false;
  $(document).keydown(function(e) {
    if(!args) args=[]; // IE barks when args is null
    if(e.ctrlKey) isCtrl = true;
    if(e.keyCode == key.charCodeAt(0) && isCtrl) {
      callback.apply(this, args);
      return false;
    }
  }).keyup(function(e) {
    if(e.ctrlKey) isCtrl = false;
  });        
};


