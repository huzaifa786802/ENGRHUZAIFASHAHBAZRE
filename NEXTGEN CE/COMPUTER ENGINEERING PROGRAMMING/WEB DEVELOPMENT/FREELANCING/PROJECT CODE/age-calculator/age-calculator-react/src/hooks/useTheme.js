/**
 * useTheme.js — Custom hook for dark/light mode management
 * Reads/writes to localStorage so the preference persists across sessions.
 */

import { useState, useEffect } from 'react';
import { THEME } from '../utils/theme';

/**
 * @returns {{ isDark: boolean, t: object, toggleTheme: function }}
 */
export function useTheme() {
  const [isDark, setIsDark] = useState(() => {
    try {
      return localStorage.getItem('ageCalcTheme') !== 'light';
    } catch {
      return true; // default to dark
    }
  });

  // Persist preference whenever it changes
  useEffect(() => {
    try {
      localStorage.setItem('ageCalcTheme', isDark ? 'dark' : 'light');
    } catch {
      // localStorage not available (e.g., private browsing)
    }
  }, [isDark]);

  const toggleTheme = () => setIsDark(prev => !prev);

  return {
    isDark,
    t: isDark ? THEME.dark : THEME.light,
    toggleTheme,
  };
}
