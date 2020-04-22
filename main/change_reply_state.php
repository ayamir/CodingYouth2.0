<?php
include_once("../connectDB.php");
$post_title = $_GET['post_title'];
$post_owner_id = $_GET['post_owner_id'];
$reply_owner_id = $_GET['reply_owner_id'];
$point = $_GET['point'];
$update_post_owner_point = mysqli_query($connect, "update sign set point = (point - $point) where user_id = '".$post_owner_id."'");
$update_post_owner_exp = mysqli_query($connect, "update user set exp = (exp + $point) where id = $post_owner_id");
$update_reply_owner_point = mysqli_query($connect, "update sign set point = (point + $point) where user_id = '".$reply_owner_id."'");
$update_reply_state = mysqli_query($connect, "update reply set reply_state = 1 where reply_owner_id = '".$reply_owner_id."' and reply_object_id = '".$post_owner_id."' and reply_post_title = '".$post_title."'");
if (!$update_post_owner_point || !$update_post_owner_exp || !$update_reply_owner_point || !$update_reply_state) {
    die("调整用户积分失败：" . mysqli_error($connect));
} else {
    echo "<script>window.location.href='post.php?post_title=$post_title&post_owner_id=$post_owner_id'</script>";
}