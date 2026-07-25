/**
 * Age Calculator — app.js
 * Author   : Your Name
 * Platform : Fiverr & Workchest
 *
 * Modules:
 *  - Theme (dark / light toggle)
 *  - Input validation
 *  - Age calculation (years, months, days)
 *  - Life stats (total days, hours, minutes, heartbeats, weeks)
 *  - Birthday countdown (live, real-time)
 *  - Zodiac sign detection
 *  - Birthstone lookup
 *  - Generation identifier
 */
'use strict';
/* ── DOM References ─────────────────────────────────────────────────────────── */
const themeBtn       = document.getElementById('themeBtn');
const dobInput       = document.getElementById('dob');
const calcDateInput  = document.getElementById('calcDate');
const calcBtn        = document.getElementById('calcBtn');
const errMsg         = document.getElementById('errMsg');
const resultsEl      = document.getElementById('results');
// Age display
const resYears    = document.getElementById('resYears');
const resMonths   = document.getElementById('resMonths');
const resDays     = document.getElementById('resDays');
// Stats
const totalDaysEl    = document.getElementById('totalDays');
const totalHoursEl   = document.getElementById('totalHours');
const totalMinsEl    = document.getElementById('totalMinutes');
const heartbeatsEl   = document.getElementById('heartbeats');
const totalWeeksEl   = document.getElementById('totalWeeks');
const dayOfWeekEl    = document.getElementById('dayOfWeek');
// Countdown
const countdownDateEl = document.getElementById('countdownDate');
const cdDaysEl        = document.getElementById('cdDays');
const cdHoursEl       = document.getElementById('cdHours');
const cdMinsEl        = document.getElementById('cdMins');
const cdSecsEl        = document.getElementById('cdSecs');

// Extras
const zodiacIconEl    = document.getElementById('zodiacIcon');
const zodiacSignEl    = document.getElementById('zodiacSign');
const zodiacDatesEl   = document.getElementById('zodiacDates');
const stoneIconEl     = document.getElementById('stoneIcon');
const birthStoneEl    = document.getElementById('birthStone');
const stoneMonthEl    = document.getElementById('stoneMonth');
const generationEl    = document.getElementById('generation');
const generationRangeEl = document.getElementById('generationRange');
/* ── State ──────────────────────────────────────────────────────────────────── */
let countdownTimer = null;
/* ═══════════════════════════════════════════════════════════════════════════════
   THEME
═══════════════════════════════════════════════════════════════════════════════ */
/**
 * Apply saved theme preference on page load.
 */
(function initTheme() {
  if (localStorage.getItem('theme') === 'light') {
    document.body.classList.add('light-mode');
  }
})();

themeBtn.addEventListener('click', () => {
  document.body.classList.toggle('light-mode');
  const isDark = !document.body.classList.contains('light-mode');
  localStorage.setItem('theme', isDark ? 'dark' : 'light');
});
/* ═══════════════════════════════════════════════════════════════════════════════
   INITIALIZATION
═══════════════════════════════════════════════════════════════════════════════ */
/**
 * Set max date on DOB input and default value on "Calculate As Of".
 */
(function initDates() {
  const todayStr = toDateString(new Date());
  dobInput.max = todayStr;
  calcDateInput.value = todayStr;
})();
/* ═══════════════════════════════════════════════════════════════════════════════
   EVENT LISTENERS
═══════════════════════════════════════════════════════════════════════════════ */
calcBtn.addEventListener('click', calculate);
dobInput.addEventListener('keydown', (e) => {
  if (e.key === 'Enter') calculate();
});
/* ═══════════════════════════════════════════════════════════════════════════════
   MAIN CALCULATE FUNCTION
═══════════════════════════════════════════════════════════════════════════════ */
function calculate() {
  clearError();
  const dobStr      = dobInput.value;
  const calcStr     = calcDateInput.value;
  /* Validate DOB */
  if (!dobStr) {
    showError('Please enter your date of birth.');
    return;
  }
  const dob       = parseLocalDate(dobStr);
  const calcDate  = calcStr ? parseLocalDate(calcStr) : parseLocalDate(toDateString(new Date()));
  if (dob >= calcDate) {
    showError('Date of birth must be before the "Calculate As Of" date.');
    return;
  }
  /* ── Age ────────────────────────────────────────────────── */
  const { years, months, days } = getAge(dob, calcDate);
  resYears.textContent  = years;
  resMonths.textContent = months;
  resDays.textContent   = days;
  /* ── Life Stats ─────────────────────────────────────────── */
  const totalDays    = Math.floor((calcDate - dob) / MS_PER_DAY);
  const totalHours   = totalDays * 24;
  const totalMins    = totalHours * 60;
  const totalWeeks   = Math.floor(totalDays / 7);
  const heartbeats   = Math.round(totalMins * 75); // avg 75 bpm
  totalDaysEl.textContent  = totalDays.toLocaleString();
  totalHoursEl.textContent = totalHours.toLocaleString();
  totalMinsEl.textContent  = totalMins.toLocaleString();
  heartbeatsEl.textContent = formatLargeNumber(heartbeats);
  totalWeeksEl.textContent = totalWeeks.toLocaleString();
  dayOfWeekEl.textContent  = dob.toLocaleDateString('en-US', { weekday: 'long' });
  /* ── Countdown ──────────────────────────────────────────── */
  if (countdownTimer) clearInterval(countdownTimer);
  startCountdown(dob);
  /* ── Extras ─────────────────────────────────────────────── */
  const zodiac = getZodiac(dob);
  zodiacIconEl.textContent  = zodiac.icon;
  zodiacSignEl.textContent  = zodiac.name;
  zodiacDatesEl.textContent = zodiac.dates;
  const stone = getBirthstone(dob.getMonth());
  stoneIconEl.textContent   = stone.icon;
  birthStoneEl.textContent  = stone.name;
  stoneMonthEl.textContent  = stone.meaning;
  const gen = getGeneration(dob.getFullYear());
  generationEl.textContent      = gen.name;
  generationRangeEl.textContent = gen.range;
  /* ── Show results ───────────────────────────────────────── */
  resultsEl.classList.add('visible');
  setTimeout(() => {
    resultsEl.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
  }, 100);
}
/* ═══════════════════════════════════════════════════════════════════════════════
   AGE CALCULATION
═══════════════════════════════════════════════════════════════════════════════ */
const MS_PER_DAY = 86_400_000;
/**
 * Calculates the exact age between two dates.
 * Handles month-end boundaries and leap years correctly.
 *
 * @param {Date} dob      - Date of birth
 * @param {Date} toDate   - Reference date (today or custom)
 * @returns {{ years: number, months: number, days: number }}
 */
function getAge(dob, toDate) {
  let years  = toDate.getFullYear() - dob.getFullYear();
  let months = toDate.getMonth()    - dob.getMonth();
  let days   = toDate.getDate()     - dob.getDate();
  // Adjust if days are negative — borrow from previous month
  if (days < 0) {
    months--;
    const lastDayOfPrevMonth = new Date(toDate.getFullYear(), toDate.getMonth(), 0).getDate();
    days += lastDayOfPrevMonth;
  }
  // Adjust if months are negative — borrow from previous year
  if (months < 0) {
    years--;
    months += 12;
  }
  return { years, months, days };
}
/* ═══════════════════════════════════════════════════════════════════════════════
   BIRTHDAY COUNTDOWN (live real-time)
═══════════════════════════════════════════════════════════════════════════════ */
/**
 * Starts a live 1-second interval countdown to the user's next birthday.
 * @param {Date} dob - Date of birth
 */
function startCountdown(dob) {
  function tick() {
    const now = new Date();
    // Build next birthday date in current year
    let nextBirthday = new Date(now.getFullYear(), dob.getMonth(), dob.getDate());
    // If birthday already passed this year, jump to next year
    if (nextBirthday <= now) {
      nextBirthday.setFullYear(now.getFullYear() + 1);
    }
    const diff = nextBirthday - now;
    const d = Math.floor(diff / MS_PER_DAY);
    const h = Math.floor((diff % MS_PER_DAY) / 3_600_000);
    const m = Math.floor((diff % 3_600_000)  /    60_000);
    const s = Math.floor((diff %    60_000)  /     1_000);
    cdDaysEl.textContent  = String(d).padStart(2, '0');
    cdHoursEl.textContent = String(h).padStart(2, '0');
    cdMinsEl.textContent  = String(m).padStart(2, '0');
    cdSecsEl.textContent  = String(s).padStart(2, '0');
    countdownDateEl.textContent = nextBirthday.toLocaleDateString('en-US', {
      weekday: 'long', month: 'long', day: 'numeric', year: 'numeric'
    });
  }
  tick(); // immediate first call
  countdownTimer = setInterval(tick, 1000);
}
/* ═══════════════════════════════════════════════════════════════════════════════
   ZODIAC SIGN
═══════════════════════════════════════════════════════════════════════════════ */
const ZODIAC_SIGNS = [
  { name: 'Capricorn',    icon: '♑', dates: 'Dec 22 – Jan 19',  check: (m, d) => (m === 12 && d >= 22) || (m === 1 && d <= 19) },
  { name: 'Aquarius',     icon: '♒', dates: 'Jan 20 – Feb 18',  check: (m, d) => (m === 1  && d >= 20) || (m === 2 && d <= 18) },
  { name: 'Pisces',       icon: '♓', dates: 'Feb 19 – Mar 20',  check: (m, d) => (m === 2  && d >= 19) || (m === 3 && d <= 20) },
  { name: 'Aries',        icon: '♈', dates: 'Mar 21 – Apr 19',  check: (m, d) => (m === 3  && d >= 21) || (m === 4 && d <= 19) },
  { name: 'Taurus',       icon: '♉', dates: 'Apr 20 – May 20',  check: (m, d) => (m === 4  && d >= 20) || (m === 5 && d <= 20) },
  { name: 'Gemini',       icon: '♊', dates: 'May 21 – Jun 20',  check: (m, d) => (m === 5  && d >= 21) || (m === 6 && d <= 20) },
  { name: 'Cancer',       icon: '♋', dates: 'Jun 21 – Jul 22',  check: (m, d) => (m === 6  && d >= 21) || (m === 7 && d <= 22) },
  { name: 'Leo',          icon: '♌', dates: 'Jul 23 – Aug 22',  check: (m, d) => (m === 7  && d >= 23) || (m === 8 && d <= 22) },
  { name: 'Virgo',        icon: '♍', dates: 'Aug 23 – Sep 22',  check: (m, d) => (m === 8  && d >= 23) || (m === 9 && d <= 22) },
  { name: 'Libra',        icon: '♎', dates: 'Sep 23 – Oct 22',  check: (m, d) => (m === 9  && d >= 23) || (m === 10 && d <= 22) },
  { name: 'Scorpio',      icon: '♏', dates: 'Oct 23 – Nov 21',  check: (m, d) => (m === 10 && d >= 23) || (m === 11 && d <= 21) },
  { name: 'Sagittarius',  icon: '♐', dates: 'Nov 22 – Dec 21',  check: (m, d) => (m === 11 && d >= 22) || (m === 12 && d <= 21) },
];
/**
 * Returns the zodiac sign for a given date of birth.
 * @param {Date} dob
 * @returns {{ name, icon, dates }}
 */
function getZodiac(dob) {
  const m = dob.getMonth() + 1;
  const d = dob.getDate();
  return ZODIAC_SIGNS.find(sign => sign.check(m, d)) || ZODIAC_SIGNS[0];
}
/* ═══════════════════════════════════════════════════════════════════════════════
   BIRTHSTONE
═══════════════════════════════════════════════════════════════════════════════ */
const BIRTHSTONES = [
  { name: 'Garnet',      icon: '🔴', meaning: 'Loyalty & Love' },
  { name: 'Amethyst',    icon: '💜', meaning: 'Calm & Clarity' },
  { name: 'Aquamarine',  icon: '🔵', meaning: 'Courage & Serenity' },
  { name: 'Diamond',     icon: '💎', meaning: 'Strength & Invincibility' },
  { name: 'Emerald',     icon: '💚', meaning: 'Wisdom & Growth' },
  { name: 'Pearl',       icon: '⚪', meaning: 'Purity & Integrity' },
  { name: 'Ruby',        icon: '❤️',  meaning: 'Passion & Protection' },
  { name: 'Peridot',     icon: '🟢', meaning: 'Healing & Strength' },
  { name: 'Sapphire',    icon: '🔷', meaning: 'Truth & Sincerity' },
  { name: 'Opal',        icon: '🌈', meaning: 'Hope & Creativity' },
  { name: 'Topaz',       icon: '🟡', meaning: 'Abundance & Cheer' },
  { name: 'Turquoise',   icon: '🩵', meaning: 'Fortune & Success' },
];
/**
 * Returns the birthstone for a given month index (0 = January).
 * @param {number} monthIndex
 * @returns {{ name, icon, meaning }}
 */
function getBirthstone(monthIndex) {
  return BIRTHSTONES[monthIndex] || BIRTHSTONES[0];
}
/* ═══════════════════════════════════════════════════════════════════════════════
   GENERATION
═══════════════════════════════════════════════════════════════════════════════ */
const GENERATIONS = [
  { name: 'Greatest Generation', range: 'Born before 1928',   from: 0,    to: 1927 },
  { name: 'Silent Generation',   range: '1928 – 1945',        from: 1928, to: 1945 },
  { name: 'Baby Boomer',         range: '1946 – 1964',        from: 1946, to: 1964 },
  { name: 'Generation X',        range: '1965 – 1980',        from: 1965, to: 1980 },
  { name: 'Millennial',          range: '1981 – 1996',        from: 1981, to: 1996 },
  { name: 'Generation Z',        range: '1997 – 2012',        from: 1997, to: 2012 },
  { name: 'Generation Alpha',    range: '2013 – present',     from: 2013, to: 9999 },
];
/**
 * Returns the generation for a given birth year.
 * @param {number} year
 * @returns {{ name, range }}
 */
function getGeneration(year) {
  return GENERATIONS.find(g => year >= g.from && year <= g.to) || GENERATIONS[0];
}
/* ═══════════════════════════════════════════════════════════════════════════════
   UTILITIES
═══════════════════════════════════════════════════════════════════════════════ */
/**
 * Parses a YYYY-MM-DD string as a local date (avoids UTC timezone offset issues).
 * @param {string} str - e.g. "1990-06-15"
 * @returns {Date}
 */
function parseLocalDate(str) {
  const [y, m, d] = str.split('-').map(Number);
  return new Date(y, m - 1, d);
}
/**
 * Formats a Date object as YYYY-MM-DD string.
 * @param {Date} date
 * @returns {string}
 */
function toDateString(date) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}
/**
 * Formats a large number into a compact readable form.
 * e.g. 2_400_000_000 → "2.4B"
 * @param {number} n
 * @returns {string}
 */
function formatLargeNumber(n) {
  if (n >= 1e9) return (n / 1e9).toFixed(1) + 'B';
  if (n >= 1e6) return (n / 1e6).toFixed(1) + 'M';
  return n.toLocaleString();
}
/**
 * Shows an error message and highlights the DOB field.
 * @param {string} message
 */
function showError(message) {
  dobInput.classList.add('error');
  errMsg.textContent = message;
  errMsg.classList.add('show');
}
/**
 * Clears any active error state.
 */
function clearError() {
  dobInput.classList.remove('error');
  errMsg.classList.remove('show');
}