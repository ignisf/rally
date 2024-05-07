import consumer from "./consumer";

consumer.subscriptions.create("DashboardReloadChannel", {
    connected() {
    },

    disconnected() {
    },

    received(data) {
        if (data.reload) {
            Turbo.visit('/');
        }
    }
});
