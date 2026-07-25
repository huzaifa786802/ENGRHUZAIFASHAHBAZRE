/**
 * AgeCalculator.jsx — Root component
 * Assembles all sub-components and connects hooks.
 *
 * ─── USAGE ──────────────────────────────────────────────────────────────────
 *   import AgeCalculator from './components/AgeCalculator';
 *   <AgeCalculator />
 *
 * ─── REQUIRES ───────────────────────────────────────────────────────────────
 *   React 18+  (no other dependencies)
 */

import { useRef } from 'react';
import { useTheme }         from '../hooks/useTheme';
import { useAgeCalculator } from '../hooks/useAgeCalculator';

import Header           from './Header';
import Hero             from './Hero';
import DateForm         from './DateForm';
import AgeDisplay       from './AgeDisplay';
import StatsGrid        from './StatsGrid';
import BirthdayCountdown from './BirthdayCountdown';
import ExtrasRow        from './ExtrasRow';
import Divider          from './Divider';
import Footer           from './Footer';

export default function AgeCalculator() {
  const { isDark, t, toggleTheme } = useTheme();

  const {
    dob, setDob,
    calcDate, setCalcDate,
    error, result,
    handleCalculate, handleKeyDown,
    todayStr,
  } = useAgeCalculator();

  const resultsRef = useRef(null);

  // Scroll to results after calculation
  const onCalculate = () => {
    handleCalculate();
    setTimeout(() => {
      resultsRef.current?.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    }, 80);
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: t.bg,
      color: t.text,
      fontFamily: "'DM Sans', system-ui, sans-serif",
      transition: 'background 0.3s, color 0.3s',
      padding: '0 0 80px',
    }}>
      <div style={{ maxWidth: 860, margin: '0 auto', padding: '0 20px' }}>

        <Header isDark={isDark} toggleTheme={toggleTheme} t={t} />
        <Hero t={t} />

        {/* ── Main Card ─────────────────────────────────────────────────── */}
        <div style={{
          background: t.surface,
          border: `1px solid ${t.border}`,
          borderRadius: 20,
          padding: 'clamp(24px, 5vw, 44px)',
          boxShadow: isDark
            ? '0 20px 60px rgba(0,0,0,0.5), 0 4px 16px rgba(0,0,0,0.3)'
            : '0 20px 60px rgba(0,0,0,0.09), 0 4px 16px rgba(0,0,0,0.06)',
        }}>

          <DateForm
            dob={dob}           setDob={setDob}
            calcDate={calcDate} setCalcDate={setCalcDate}
            todayStr={todayStr}
            error={error}
            onCalculate={onCalculate}
            onKeyDown={handleKeyDown}
            t={t}
          />

          {/* ── Results (shown after calculation) ─────────────────────── */}
          {result && (
            <div ref={resultsRef}>

              <Divider label="Your Age" t={t} />
              <AgeDisplay
                years={result.years}
                months={result.months}
                days={result.days}
                t={t}
              />

              <Divider label="Life in Numbers" t={t} />
              <StatsGrid
                totalDays={result.totalDays}
                totalHours={result.totalHours}
                totalMins={result.totalMins}
                totalWeeks={result.totalWeeks}
                heartbeats={result.heartbeats}
                dayBorn={result.dayBorn}
                t={t}
              />

              <BirthdayCountdown dob={result.dobDate} t={t} />

              <ExtrasRow
                zodiac={result.zodiac}
                stone={result.stone}
                generation={result.generation}
                t={t}
              />

            </div>
          )}
        </div>

        <Footer t={t} />
      </div>
    </div>
  );
}
