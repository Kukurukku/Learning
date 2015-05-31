var app = {
initialize: function() {
    this.bindEvents();
},
bindEvents: function() {
    document.addEventListener('deviceready', this.onDeviceReady, false);
},
onDeviceReady: function() {
    navigator.notification.alert(
                                 "ようこそ,PhoneGapへ！",
                                 this.alertConfirm,
                                 "ごあいさつ",
                                 "確認");
},
alertConfirm: function() {
    document.addEventListener('click', this.onDeviceReady, false);

},
    
calc: function(){


}
};