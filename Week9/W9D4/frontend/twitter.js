const FollowToggle = require('./follow_toggle');

$(() => {
    $(".follow-toggle").each(function (index, button) {
        new FollowToggle(button);
    })
})