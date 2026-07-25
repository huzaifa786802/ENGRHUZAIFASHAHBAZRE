/**
 * data.js — Static lookup tables
 * Zodiac signs, birthstones, and generations.
 */

export const ZODIAC_SIGNS = [
  { name: 'Capricorn',   icon: '♑', dates: 'Dec 22 – Jan 19', check: (m, d) => (m === 12 && d >= 22) || (m === 1  && d <= 19) },
  { name: 'Aquarius',    icon: '♒', dates: 'Jan 20 – Feb 18', check: (m, d) => (m === 1  && d >= 20) || (m === 2  && d <= 18) },
  { name: 'Pisces',      icon: '♓', dates: 'Feb 19 – Mar 20', check: (m, d) => (m === 2  && d >= 19) || (m === 3  && d <= 20) },
  { name: 'Aries',       icon: '♈', dates: 'Mar 21 – Apr 19', check: (m, d) => (m === 3  && d >= 21) || (m === 4  && d <= 19) },
  { name: 'Taurus',      icon: '♉', dates: 'Apr 20 – May 20', check: (m, d) => (m === 4  && d >= 20) || (m === 5  && d <= 20) },
  { name: 'Gemini',      icon: '♊', dates: 'May 21 – Jun 20', check: (m, d) => (m === 5  && d >= 21) || (m === 6  && d <= 20) },
  { name: 'Cancer',      icon: '♋', dates: 'Jun 21 – Jul 22', check: (m, d) => (m === 6  && d >= 21) || (m === 7  && d <= 22) },
  { name: 'Leo',         icon: '♌', dates: 'Jul 23 – Aug 22', check: (m, d) => (m === 7  && d >= 23) || (m === 8  && d <= 22) },
  { name: 'Virgo',       icon: '♍', dates: 'Aug 23 – Sep 22', check: (m, d) => (m === 8  && d >= 23) || (m === 9  && d <= 22) },
  { name: 'Libra',       icon: '♎', dates: 'Sep 23 – Oct 22', check: (m, d) => (m === 9  && d >= 23) || (m === 10 && d <= 22) },
  { name: 'Scorpio',     icon: '♏', dates: 'Oct 23 – Nov 21', check: (m, d) => (m === 10 && d >= 23) || (m === 11 && d <= 21) },
  { name: 'Sagittarius', icon: '♐', dates: 'Nov 22 – Dec 21', check: (m, d) => (m === 11 && d >= 22) || (m === 12 && d <= 21) },
];

export const BIRTHSTONES = [
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

export const GENERATIONS = [
  { name: 'Greatest Generation', range: 'Before 1928',    from: 0,    to: 1927 },
  { name: 'Silent Generation',   range: '1928 – 1945',    from: 1928, to: 1945 },
  { name: 'Baby Boomer',         range: '1946 – 1964',    from: 1946, to: 1964 },
  { name: 'Generation X',        range: '1965 – 1980',    from: 1965, to: 1980 },
  { name: 'Millennial',          range: '1981 – 1996',    from: 1981, to: 1996 },
  { name: 'Generation Z',        range: '1997 – 2012',    from: 1997, to: 2012 },
  { name: 'Generation Alpha',    range: '2013 – present', from: 2013, to: 9999 },
];

/** Returns the zodiac sign for a given date of birth */
export function getZodiac(dob) {
  const m = dob.getMonth() + 1;
  const d = dob.getDate();
  return ZODIAC_SIGNS.find(s => s.check(m, d)) || ZODIAC_SIGNS[0];
}

/** Returns the birthstone for a given month index (0 = January) */
export function getBirthstone(monthIndex) {
  return BIRTHSTONES[monthIndex] || BIRTHSTONES[0];
}

/** Returns the generation for a given birth year */
export function getGeneration(year) {
  return GENERATIONS.find(g => year >= g.from && year <= g.to) || GENERATIONS[0];
}
