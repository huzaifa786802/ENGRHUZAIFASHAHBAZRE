/**
 * BirthdayCountdown.jsx — Live real-time countdown to next birthday
 * Uses the useCountdown hook internally.
 */

import { useCountdown } from '../hooks/useCountdown';

function CountUnit({ value, label, t }) {
  return (
    <div style={{ textAlign: 'center' }}>
      <span style={{
        fontFamily: 'Georgia, serif',
        fontSize: '1.8rem',
        fontWeight: 700,
        color: t.goldLight,
        display: 'block',
        lineHeight: 1,
      }}>
        {value}
      </span>
      <span style={{
        fontSize: '0.62rem',
        color: t.muted,
        letterSpacing: '0.1em',
        textTransform: 'uppercase',
      }}>
        {label}
      </span>
    </div>
  );
}

export default function BirthdayCountdown({ dob, t }) {
  const { d, h, m, s, dateStr } = useCountdown(dob);

  return (
    <div style={{
      background: `linear-gradient(135deg, ${t.goldDim}, transparent)`,
      border: `1px solid ${t.gold}44`,
      borderRadius: 16,
      padding: '22px 24px',
      marginBottom: 24,
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      flexWrap: 'wrap',
      gap: 16,
    }}>
      {/* Label */}
      <div>
        <div style={{
          fontFamily: 'Georgia, serif',
          fontSize: '1.05rem',
          color: t.gold,
          fontWeight: 700,
        }}>
          🎂 Next Birthday Countdown
        </div>
        <div style={{ fontSize: '0.78rem', color: t.muted, marginTop: 4 }}>
          {dateStr}
        </div>
      </div>

      {/* Timer units */}
      <div style={{ display: 'flex', gap: 10, alignItems: 'flex-start' }}>
        <CountUnit value={d} label="Days" t={t} />
        <span style={{ fontSize: '1.5rem', color: t.gold, marginTop: 4 }}>:</span>
        <CountUnit value={h} label="Hrs"  t={t} />
        <span style={{ fontSize: '1.5rem', color: t.gold, marginTop: 4 }}>:</span>
        <CountUnit value={m} label="Min"  t={t} />
        <span style={{ fontSize: '1.5rem', color: t.gold, marginTop: 4 }}>:</span>
        <CountUnit value={s} label="Sec"  t={t} />
      </div>
    </div>
  );
}
