class EncryptForm {
  constructor() {
    this._shaObj = new jsSHA("SHA-256", "TEXT");
  }

  createPassword(password) {
    this._shaObj.update(password);
    return this._shaObj.getHash("HEX");
  }
}

class SubmitEncryptedForm {
  constructor() {
    this._sessionForm = $("#session-form");
    this._userForm = $("#user-form");
  }

  login() {
    this._sessionForm.submit(function(e) {
      e.preventDefault();
      var $currentUsername = $('#session-username').val(),
          $currentPassword = $('#session-password').val(),
          newPassword = new EncryptForm();

      var encrypted = newPassword.createPassword($currentPassword);

      $('#encrypted-username').val($currentUsername);
      $('#encrypted-password').val(encrypted);

      $('#encrypted-form').submit();
    });
  }

  signup() {
    this._userForm.submit(function(e) {
      e.preventDefault();
      var $currentName = $('#user-name').val(),
          $currentUserName = $('#user-username').val(),
          $currentEmail = $('#user-email').val(),
          $currentPassword = $('#user-password').val(),
          $currentConfirmation = $('#user-password-confirmation').val();

      if ($currentPassword === $currentConfirmation) {
        let encrypted = new EncryptForm();
        let newPassword = encrypted.createPassword($currentPassword);

        $('#encrypted-name').val($currentName);
        $('#encrypted-username').val($currentUserName);
        $('#encrypted-email').val($currentEmail);
        $('#encrypted-password').val(newPassword);
        $('#encrypted-password-confirmation').val(newPassword);

        $('#encrypted-form').submit();
      } else {
        return false;
      }
    });
  }
}

$(document).ready(() => {
  var enc = new SubmitEncryptedForm();
  enc.login();
  enc.signup();
});
