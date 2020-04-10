function FollowToggle(el){
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followsState = this.$el.data('initial-follow-state');
    this.render();
    this.$el.on('click', this.handleClick.bind(this))
}

FollowToggle.prototype.render = function(){
    if (this.followState === 'unfollowed'){
        
        this.$el.text('Follow!');
    } else {
        this.$el.text('Unfollow!');
    }
}

FollowToggle.prototype.handleClick = function(click){
    
    click.preventDefault();
    if (!this.followState === 'unfollowed'){
        $.ajax({
            url: `/users/${this.userId}/follow`,
            type: 'POST',
            dataType: 'JSON',
            success() {
                this.followsState = "followed";
                this.render();
            }
        })
    } else {
        $.ajax({
            // debugger;
            url: `/users/${this.userId}/follow`,
            type: 'DELETE',
            dataType: 'JSON',
            success() {
                this.followsState = "unfollowed";
                this.render();
            }
        })
    }
}

// $('#handleClick').on('click', e => {
//     e.preventDefault();
//     // Save GIF
//     saveGif();
// });


module.exports = FollowToggle;

