<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!-- Write your name and matric number here -->

<head>
<meta charset="ISO-8859-1">
    <title>Cust Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>

		.tbl{
			width: 100%;
			color:#f8f9fa;
			font-weight: 600;
			background-color: #505050;
			border: 1px solid #008080;
			margin-top: 1.5em;
			margin-bottom: 1em;
		}

        .btn{
            transition: all .5s ease;
            width: 50%;
            border-radius: 30px;
            color:#008080;
            font-weight: 600;
            background-color: #fff;
            border: 1px solid #008080;
            margin-top: 1.5em;
            margin-bottom: 1em;
        }
        .btn:hover, .btn:focus{
            background-color: #008080;
            color:#fff;
        }
        </style>
    </head>

<body>
    <div class="container-fluid">
        <h3>MyCafe</h3>
        <h5>Payment</h5>
          
                <form method="pls_complete" action="pls_complete">
            <div class="col-lg-5">
                <h4>please complete this section </h4><br><br><br><br><br>

				
				<div class="form-group>">
                <label for="payment">Payment Method : </label>
                
                    <select required name="payment">
                        <option value="" disabled selected>Select your payment method...</option>
                        <option value="online banking">Online Banking</option>
                        <option value="card">Credit/Debit Card</option>
                        <option value="e-wallet">E-Wallet</option>
                    </select>
                
                <br><br>
            </div>
            <input class="btn" type="submit" value="confirm payment" name="orderBtn" />

        </form>
    </div>
</body>

</html>