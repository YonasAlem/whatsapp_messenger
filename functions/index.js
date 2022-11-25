const functions = require("firebase-functions");
const admin = require('firebase-admin');
admin.initializeApp();

const firestore = admin.firestore();

exports.onUserStateChange = functions.database.ref('/{uid}/active').onUpdate(
    async (change, context) => {
        const isActive = change.after.val();
        const firestoreRef = firestore.doc(`users/${context.params.uid}`);

        return firestoreRef.update({
            active: isActive,
            lastSeen: Date.now(),
        });
    }
);