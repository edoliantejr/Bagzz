const admin = require("firebase-admin");
var serviceAccount = require("C:/Users/JhunR/AndroidStudioProjects/bagzz/functions/bagzz-dev-firebase-adminsdk-l34cd-f42134c7c5.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const message = {
  data: {
    notificationId: "2342123",
    title: "Fullar Campaign",
    body: "New campaign is nice and very good to play",
    name: "New campaign name",
    image_url: "https://www.pixsy.com/wp-content/uploads/2021/04/edi-libedinsky-1bhp9zBPHVE-unsplash-1-1536x1024.jpeg",
  },
  topic: "BAG_TOPIC",
};

const message1 = {
  notification: {
    title: "Weather Warning!",
    body: "A new weather warning has been issued for your location.",
    imageUrl: "https://cdn-teams-slug.flaticon.com/google.jpg",
  },
  topic: "BAG_TOPIC",
};


admin
  .messaging()
  .send(message)
  .then((response) => {
    console.log("Successfully sent message:", response);
  })
  .catch((error) => {
    console.log("Error sending message:", error);
  });
