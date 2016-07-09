function validateEmail() {
    var email = document.getElementById("user_email").value;
  
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if( re.test(email) == true){
      document.getElementById("user_email").style.borderColor = "#00FF00";
      document.getElementById("emailCheck").style.display = "inline";
    }else{
      document.getElementById("user_email").style.borderColor = "red";
       document.getElementById("emailCheck").style.display = "none";
    }
}

function updateMeter(score){
  //update meter with score and colors
  document.getElementById("passwordMeter").style.width = score*100/4 + '%';
  document.getElementById("meterText").innerHTML = score;
  if(score >= 2)  document.getElementById("passwordMeter").style.background = "#00FF00";
  else if( score <= 1) document.getElementById("passwordMeter").style.background = "yellow";
}


function passwordScore(){
  var password = document.getElementById("user_password").value;
  var result;
  result = zxcvbn(password);
  return result.score;
}

function validatePassword()
{
  var score;
  var password;
  password = document.getElementById("user_password").value;
  //score the password
  score = passwordScore(password);
  passwordsMatch();
  
  updateMeter(score);
  
  if(password.length >= 6)
  {
    if(score < 2){
     document.getElementById("user_password").valid = false;
    }else document.getElementById("user_password").valid = true;
  }else document.getElementById("user_password").valid = false;
  
  
  if(document.getElementById("user_password").valid == false){
    document.getElementById("user_password").style.borderColor = "red";
    document.getElementById("passwordCheck").style.display = "none";
  }else{
    document.getElementById("user_password").style.borderColor = "#00FF00";
    document.getElementById("passwordCheck").style.display = "inline";
  }
}

function passwordsMatch() {
  var password;
  var passwordConfirmation;
  password = document.getElementById("user_password").value;
  passwordConfirmation = document.getElementById("user_password_confirmation").value
  
  if((password == passwordConfirmation) && password != ""){
    document.getElementById("user_password_confirmation").style.borderColor = "#00FF00";
    document.getElementById("passwordConfirmationCheck").style.display = "inline";
    document.getElementById("user_password_confirmation").valid = true;
  }else {
    document.getElementById("user_password_confirmation").style.borderColor = "red";
    document.getElementById("passwordConfirmationCheck").style.display = "none";
    document.getElementById("user_password_confirmation").valid = false;
  }
}
