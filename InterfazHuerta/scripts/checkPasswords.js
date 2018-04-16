$('form').on('submit',function(){
   if($('#passwd-input').val()!=$('#ckPasswd-input').val()){
       alert('Las contraseñas no coinciden');
       return false;
   }
   return true;
});
