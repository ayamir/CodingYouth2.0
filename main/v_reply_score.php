<?php
include_once("../connectDB.php");
$v_reply_id = $_GET['v_reply_id'];
$video_title = $_GET['video_title'];
$judge = $_GET['judge'];
$video_owner_id = $_GET['video_owner_id'];

if ($judge == 1) {
    $update_reply_score = "update v_reply set v_reply_score = (v_reply_score + 1) where v_reply_id = $v_reply_id";
    if (!mysqli_query($connect, $update_reply_score)) {
        die("评论点赞失败：" . mysqli_error($connect));
    } else {
        echo "<script>window.location.href='video.php?video_title=$video_title&video_owner_id=$video_owner_id'</script>";
    }
} else {
    $update_reply_score = "update v_reply set v_reply_dis_score = (v_reply_dis_score + 1) where v_reply_id = $v_reply_id";
    if (!mysqli_query($connect, $update_reply_score)) {
        die("评论踩失败：" . mysqli_error($connect));
    } else {
        echo "<script>window.location.href='video.php?video_title=$video_title&video_owner_id=$video_owner_id'</script>";
    }
}