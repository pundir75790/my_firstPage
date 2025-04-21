<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Email Validator</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 30px;
      background-color: #f4f4f4;
    }
    input, button {
      padding: 10px;
      font-size: 16px;
    }
    .message {
      margin-top: 15px;
      font-weight: bold;
    }
    .valid {
      color: green;
    }
    .invalid {
      color: red;
    }
  </style>
</head>
<body>

  <h2>Check if Email is Valid</h2>
  <input type="text" id="email" placeholder="Enter your email" />
  <button onclick="checkEmail()">Validate</button>

  <div id="result" class="message"></div>

  <script>
    function isValidEmail(email) {
      const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return regex.test(email);
    }

    function checkEmail() {
      const email = document.getElementById("email").value;
      const result = document.getElementById("result");

      if (isValidEmail(email)) {
        result.textContent = "✅ Valid Email!";
        result.className = "message valid";
      } else {
        result.textContent = "❌ Invalid Email!";
        result.className = "message invalid";
      }
    }
  </script>

</body>
</html>
