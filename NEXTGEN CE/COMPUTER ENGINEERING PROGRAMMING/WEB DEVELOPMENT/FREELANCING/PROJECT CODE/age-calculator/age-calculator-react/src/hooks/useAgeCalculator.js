/**
 * useAgeCalculator.js — Core calculation logic hook
 * Manages form state, validation, and result computation.
 */

import { useState, useCallback } from 'react';
import { parseLocalDate, toDateStr, calcAge, calcLifeStats } from '../utils/dateUtils';
import { getZodiac, getBirthstone, getGeneration } from '../data/data';

/**
 * @returns {{
 *   dob, setDob,
 *   calcDate, setCalcDate,
 *   error,
 *   result,
 *   handleCalculate,
 *   handleKeyDown,
 *   todayStr,
 * }}
 */
export function useAgeCalculator() {
  const todayStr = toDateStr(new Date());

  const [dob,      setDob]      = useState('');
  const [calcDate, setCalcDate] = useState(todayStr);
  const [error,    setError]    = useState('');
  const [result,   setResult]   = useState(null);

  const handleCalculate = useCallback(() => {
    setError('');

    // ── Validation ────────────────────────────────────────────────────────
    if (!dob) {
      setError('Please enter your date of birth.');
      return;
    }

    const dobDate   = parseLocalDate(dob);
    const toDateObj = parseLocalDate(calcDate || todayStr);

    if (dobDate >= toDateObj) {
      setError('Date of birth must be before the "Calculate As Of" date.');
      return;
    }

    // ── Calculation ───────────────────────────────────────────────────────
    const age   = calcAge(dobDate, toDateObj);
    const stats = calcLifeStats(dobDate, toDateObj);

    setResult({
      ...age,
      ...stats,
      dobDate,
      zodiac:     getZodiac(dobDate),
      stone:      getBirthstone(dobDate.getMonth()),
      generation: getGeneration(dobDate.getFullYear()),
    });
  }, [dob, calcDate, todayStr]);

  const handleKeyDown = useCallback((e) => {
    if (e.key === 'Enter') handleCalculate();
  }, [handleCalculate]);

  return {
    dob,      setDob,
    calcDate, setCalcDate,
    error,
    result,
    handleCalculate,
    handleKeyDown,
    todayStr,
  };
}
