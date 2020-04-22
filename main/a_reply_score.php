<?php
include_once("../connectDB.php");
$a_reply_id = $_GET['a_reply_id'];
$article_title = $_GET['article_title'];
$judge = $_GET['judge'];
$article_owner_id = $_GET['article_owner_id'];

if ($judge == 1) {
    $update_reply_score = "update a_reply set a_reply_score = (a_reply_score + 1) where `a_reply_id` = $a_reply_id";
    if (!mysqli_query($connect, $update_reply_score)) {
        die("评论点赞失败：" . mysqli_error($connect));
    } else {
        echo "<script>window.location.href='article.php?article_title=$article_title&article_owner_id=$article_owner_id'</script>";
    }
} else {
    $update_reply_dis_score = "update a_reply set a_reply_dis_score = (a_reply_dis_score + 1) where a_reply_id = $a_reply_id";
    if (!mysqli_query($connect, $update_reply_dis_score)) {
        die("评论踩失败：" . mysqli_error($connect));
    } else {
        echo "<script>window.location.href='article.php?article_title=$article_title&article_owner_id=$article_owner_id'</script>";
    }
}
