<?php
include_once("../connectDB.php");
$reply_id = $_GET['reply_id'];
$post_title = $_GET['post_title'];
$judge = $_GET['judge'];
$post_owner_id = $_GET['post_owner_id'];

if ($judge == 1) {
    $update_reply_score = "update reply set reply_score = (reply_score + 1) where `reply_id` = $reply_id";
    if (!mysqli_query($connect, $update_reply_score)) {
        die("评论点赞失败：" . mysqli_error($connect));
    } else {
        echo "<script>window.location.href='post.php?post_title=$post_title&post_owner_id=$post_owner_id'</script>";
    }
} else {
    $update_reply_dis_score = "update reply set reply_dis_score = (reply_dis_score + 1) where `reply_id` = $reply_id";
    if (!mysqli_query($connect, $update_reply_dis_score)) {
        die("评论踩失败：" . mysqli_error($connect));
    } else {
        echo "<script>window.location.href='post.php?post_title=$post_title&post_owner_id=$post_owner_id'</script>";
    }
}
