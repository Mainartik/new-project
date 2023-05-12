<!DOCTYPE html>
<html lang="en">

<head>
    <title>Forgot</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<?= asset('public/auth/vendor/bootstrap/css/bootstrap.min.css') ?>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?= asset('public/auth/fonts/font-awesome-4.7.0/css/font-awesome.min.css') ?>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?= asset('public/auth/vendor/animate/animate.css') ?>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?= asset('public/auth/vendor/css-hamburgers/hamburgers.min.css') ?>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?= asset('public/auth/vendor/select2/select2.min.css') ?>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?= asset('public/auth/css/util.css') ?>">
    <link rel="stylesheet" type="text/css" href="<?= asset('public/auth/css/main.css') ?>">
    <!--===============================================================================================-->
</head>

</head>

<body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                <img src="<?= asset('public/auth/images/img-01.png') ?>" alt="IMG">
                </div>

                <form method="post" action="<?= url('forgot/request') ?>" class="login100-form validate-form">
                    <span class="login100-form-title">
                        Forgot Password
                    </span>

                    <?php 
                    $message = flash('forgot_error');
                    if (!empty($message)) {
                        ?>
                    <div class="mb-2 alert alert-danger"> <small class="form-text text-danger"><?= $message ?></small> </div>
                    <?php
                    } ?>

                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <input class="input100" type="text" name="email" placeholder="Email">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>


                    <div class="container-login100-form-btn">
                        <button type="submit" class="login100-form-btn">
                            Send
                        </button>
                    </div>



                    <div class="text-center p-t-136">
                        <a class="txt2" href="#">
                            Create your Account
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script src="<?= asset('public/auth/vendor/jquery/jquery-3.2.1.min.js') ?>"></script>
    <script src="<?= asset('public/auth/vendor/bootstrap/js/popper.js') ?>"></script>
    <script src="<?= asset('public/auth/vendor/bootstrap/js/bootstrap.min.js') ?>"></script>
    <script src="<?= asset('public/auth/vendor/select2/select2.min.js') ?>"></script>
    <script src="<?= asset('public/auth/vendor/tilt/tilt.jquery.min.js') ?>"></script>
    <script src="<?= asset('public/auth/js/main.js') ?>"></script>


</body>


</html>