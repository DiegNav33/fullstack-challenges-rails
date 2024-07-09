/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */
/* eslint-disable import/extensions */

import runChallenges from "../spec/inbox_examiner.js";

const hasNewMessage = () => {
  // TODO: return true with a probability of 20%.
  return Math.random() < 0.2;
};

console.log(hasNewMessage());

const newMessage = () => {
  // TODO: return a random message as an object with two keys, subject and sender
  const subjects = [
    'Welcome to GitHub',
    'Your order has been shipped',
    'Important security update',
    'Meeting tomorrow at 10 AM',
    'Invitation to connect on LinkedIn',
    "I'm Back"
  ];

  const senders = [
    'GitHub Team',
    'Amazon',
    'Security Team',
    'HR Department',
    'LinkedIn',
    'Arnold Schwarzenegger'
  ];

  const sample = (array) => {
    return array[Math.floor(Math.random() * array.length)];
  };

  return {
    sender: sample(senders),
    subject: sample(subjects)
  };
};

const appendMessageToDom = (message) => {
  // TODO: append the given message to the DOM (as a new row of `#inbox`)
  const inboxParent = document.querySelector("#inbox");
  const appendMessageToInbox = `
  <div class="row message unread">
    <div class="col-3">${message.sender}</div>
    <div class="col-9">${message.subject}</div>
  </div>`;
  return inboxParent.insertAdjacentHTML("afterbegin", appendMessageToInbox);
};

const refresh = () => {
  // TODO: Implement the global refresh logic. If there is a new message,
  //       append it to the DOM. Update the unread counter in title as well.
  if (hasNewMessage()) {
    appendMessageToDom(newMessage());
  }

  const unreadCount = document.querySelectorAll(".message.unread").length;
  const countElt = document.querySelector("#count");
  countElt.innerHTML = `(${unreadCount})`;
  document.title = `Ex 3. - Fake Inbox (${unreadCount})`;
};

// Do not remove these lines.
if (typeof window === "object") {
  document.addEventListener("DOMContentLoaded", () => {
    setInterval(refresh, 1000); // Every 1 second, the `refresh` function is called.
  });
}

// Checking exercise answers. DO NOT MODIFY THIS LINE.
runChallenges(hasNewMessage, newMessage);
export { hasNewMessage, newMessage };
