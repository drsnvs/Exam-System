<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 400px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"], input[type="password"], input[type="number"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
        }

        #btn {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        #btn:hover {
            background-color: #45a049;
        }

        #backBtn {
            text-decoration: none;
            color: #666;
            font-size: 14px;
        }

        #backBtn:hover {
            color: #333;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
<div id="container">
    <h2>Register Student</h2>
    <form action="registerStudentServlet" onsubmit="return validation()" method="POST">
        <table>
            <tr>
                <th>First Name</th>
                <td><input type="text" name="fname" id="fname" required /></td>
            </tr>
            <tr>
                <th>Middle Name</th>
                <td><input type="text" name="mname" id="mname" required /></td>
            </tr>
            <tr>
                <th>Last Name</th>
                <td><input type="text" name="lname" id="lname" required /></td>
            </tr>
            <tr>
                <th>Age</th>
                <td><input type="number" name="age" id="age" required /></td>
            </tr>
            <tr>
                <th>Stream</th>
                <td><input type="text" name="stream" id="stream" required /></td>
            </tr>
            <tr>
                <th>Create Username</th>
                <td><input type="text" name="uname" id="uname" required /></td>
            </tr>
            <tr>
                <th>Create Password</th>
                <td><input type="password" name="password" id="password" required /></td>
            </tr>
            <tr>
                <th>Confirm Password</th>
                <td><input type="password" name="cpassword" id="cpassword" required /></td>
            </tr>
            <tr>
                <td colspan="2"><input id="btn" type="submit" value="Register" name="register"/></td>
            </tr>
            <tr>
                <td colspan="2"><a href="admin.jsp" id="backBtn">Back to Admin</a></td>
            </tr>
        </table>
    </form>
</div>
<script>
    function validation() {
        var fname = document.getElementById("fname").value;
        var mname = document.getElementById("mname").value;
        var lname = document.getElementById("lname").value;
        var stream = document.getElementById("stream").value;
        var age = document.getElementById("age").value;
        var uname = document.getElementById("uname").value;
        var password = document.getElementById("password").value;
        var cpassword = document.getElementById("cpassword").value;
        if (fname.trim() === "" || mname.trim() === "" || lname.trim() === "" || stream.trim() === "" || age.trim() === "" || uname.trim() === "" || password.trim() === "" || cpassword.trim() === "") {
            alert("Please fill in all fields.");
            return false;
        }
        if (password !== cpassword) {
            alert("Password and Confirm Password do not match");
            return false;
        }
    }
</script>
</body>
</html>
