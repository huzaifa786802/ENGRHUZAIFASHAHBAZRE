/**
 * dateUtils.js — Pure date calculation helpers
 * All functions are stateless and fully unit-testable.
 */

/** Parse a YYYY-MM-DD string as a LOCAL date (avoids UTC offset issues) */
export function parseLocalDate(str) {
  const [y, m, d] = str.split('-').map(Number);
  return new Date(y, m - 1, d);
}

/** Format a Date object → YYYY-MM-DD string */
export function toDateStr(date) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

/**
 * Calculate exact age between two dates.
 * Correctly handles leap years and month-end boundaries.
 * @param {Date} dob    - Date of birth
 * @param {Date} toDate - Reference date (today or custom)
 * @returns {{ years, months, days }}
 */
export function calcAge(dob, toDate) {
  let years  = toDate.getFullYear() - dob.getFullYear();
  let months = toDate.getMonth()    - dob.getMonth();
  let days   = toDate.getDate()     - dob.getDate();

  // Borrow from previous month if days are negative
  if (days < 0) {
    months--;
    const lastDay = new Date(toDate.getFullYear(), toDate.getMonth(), 0).getDate();
    days += lastDay;
  }

  // Borrow from previous year if months are negative
  if (months < 0) {
    years--;
    months += 12;
  }

  return { years, months, days };
}

/**
 * Calculate all life stats from total days lived.
 * @param {Date} dob
 * @param {Date} toDate
 * @returns {{ totalDays, totalHours, totalMins, totalWeeks, heartbeats, dayBorn }}
 */
export function calcLifeStats(dob, toDate) {
  const totalDays  = Math.floor((toDate - dob) / 86_400_000);
  const totalHours = totalDays * 24;
  const totalMins  = totalHours * 60;
  const totalWeeks = Math.floor(totalDays / 7);
  const heartbeats = Math.round(totalMins * 75); // avg 75 bpm

  const dayBorn = dob.toLocaleDateString('en-US', { weekday: 'long' });

  return { totalDays, totalHours, totalMins, totalWeeks, heartbeats, dayBorn };
}

/**
 * Build the next birthday Date from now.
 * @param {Date} dob
 * @returns {Date}
 */
export function getNextBirthday(dob) {
  const now  = new Date();
  let next   = new Date(now.getFullYear(), dob.getMonth(), dob.getDate());
  if (next <= now) next.setFullYear(now.getFullYear() + 1);
  return next;
}

/** Format a countdown diff (ms) → { d, h, m, s } padded strings */
export function formatCountdown(diffMs) {
  const d = Math.floor(diffMs / 86_400_000);
  const h = Math.floor((diffMs % 86_400_000) / 3_600_000);
  const m = Math.floor((diffMs % 3_600_000)  /    60_000);
  const s = Math.floor((diffMs %    60_000)  /     1_000);
  return {
    d: String(d).padStart(2, '0'),
    h: String(h).padStart(2, '0'),
    m: String(m).padStart(2, '0'),
    s: String(s).padStart(2, '0'),
  };
}

/** Format large numbers compactly: 2_400_000_000 → "2.4B" */
export function fmtBig(n) {
  if (n >= 1e9) return (n / 1e9).toFixed(1) + 'B';
  if (n >= 1e6) return (n / 1e6).toFixed(1) + 'M';
  return n.toLocaleString();
}
