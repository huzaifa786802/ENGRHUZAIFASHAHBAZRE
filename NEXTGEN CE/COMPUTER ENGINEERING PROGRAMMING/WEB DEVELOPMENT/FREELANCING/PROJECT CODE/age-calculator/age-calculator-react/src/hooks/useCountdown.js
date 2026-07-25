/**
 * useCountdown.js — Custom hook for live birthday countdown
 * Updates every second, cleans up interval on unmount.
 */

import { useState, useEffect } from 'react';
import { getNextBirthday, formatCountdown } from '../utils/dateUtils';

/**
 * @param {Date|null} dob - Date of birth (null = countdown paused)
 * @returns {{ d, h, m, s, dateStr }}
 */
export function useCountdown(dob) {
  const [tick, setTick] = useState({ d: '00', h: '00', m: '00', s: '00', dateStr: '' });

  useEffect(() => {
    if (!dob) return;

    function update() {
      const next   = getNextBirthday(dob);
      const diff   = next - new Date();
      const counts = formatCountdown(Math.max(0, diff));
      setTick({
        ...counts,
        dateStr: next.toLocaleDateString('en-US', {
          weekday: 'long', month: 'long', day: 'numeric', year: 'numeric',
        }),
      });
    }

    update(); // run immediately
    const id = setInterval(update, 1000);
    return () => clearInterval(id); // cleanup on unmount / dob change

  }, [dob]);

  return tick;
}
