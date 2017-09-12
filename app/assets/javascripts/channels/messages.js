App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        // Clear textarea
        $("#message_body").val("");
        var chat_room = $('#chat_room_' + data.room);

        if (chat_room.length) {
            return chat_room.append(this.renderMessage(data));
        } else {
            this.renderPopupMessage(data);
        }
    },

    renderMessage: function(data) {
        return '<div class="item"> \
                    <div class="content"> \
                        <div class="header"><strong>' + data.user + '</strong> ' + data.time +'</div> \
                            <div class="list"> \
                                <div class="item"> \
                                    <i class="right triangle icon"></i> \
                                     ' + data.body + ' \
                                </div> \
                            </div> \
                    </div> \
        </div>';
    },

    renderPopupMessage: function(data) {
        // Not read messages counter logic
        var counter_element = $('[user_id=' + data.user_id + '] .counter');
        var counter = parseInt(counter_element.text());
        isNaN(counter) ? counter_element.text(1) : counter_element.text(++counter);

        // Popup messenger
        var popup = $('[user_id=' + data.user_id + '] .message_popup');
        popup.html(data.body);
        popup.transition('fade up');
        setTimeout(function(){
            popup.transition('fade down');
        }, 2000);
    },
});

