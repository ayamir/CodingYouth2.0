<?php
session_start();
session_destroy();
echo "<script>alert('您已成功登出!')</script>";
echo "<script>window.location.href='../index.php'</script>";