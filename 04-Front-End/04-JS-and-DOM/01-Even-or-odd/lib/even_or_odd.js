/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */
/* eslint-disable import/extensions */

import runChallenges from "../spec/even_or_odd_examiner.js";

export const evenOrOdd = (number) => {
  // TODO: this should return "even" if the number is even, "odd" otherwise``
  if (number % 2 === 0) {
    console.log("even");
    return "even";
  }
  console.log("odd");
  return "odd";
};

// Checking exercise answers. DO NOT MODIFY THIS LINE.
runChallenges(evenOrOdd);
