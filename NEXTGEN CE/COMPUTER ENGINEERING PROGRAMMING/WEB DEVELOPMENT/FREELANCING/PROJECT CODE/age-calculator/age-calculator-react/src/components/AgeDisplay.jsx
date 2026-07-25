/**
 * AgeDisplay.jsx — Shows the primary age result: Years / Months / Days
 */

function AgeUnit({ value, label, t }) {
  return (
    <div style={{
      flex: 1,
      minWidth: 110,
      textAlign: 'center',
      padding: '24px 20px',
    }}>
      <span style={{
        display: 'block',
        fontFamily: 'Georgia, serif',
        fontSize: 'clamp(2.4rem, 7vw, 4.5rem)',
        fontWeight: 900,
        color: t.goldLight,
        lineHeight: 1,
        textShadow: `0 2px 20px ${t.goldDim}`,
      }}>
        {value}
      </span>
      <span style={{
        display: 'block',
        marginTop: 8,
        fontSize: '0.7rem',
        letterSpacing: '0.14em',
        textTransform: 'uppercase',
        color: t.muted,
        fontWeight: 500,
      }}>
        {label}
      </span>
    </div>
  );
}

export default function AgeDisplay({ years, months, days, t }) {
  return (
    <div style={{
      display: 'flex',
      flexWrap: 'wrap',
      marginBottom: 32,
      borderRadius: 16,
      border: `1px solid ${t.border}`,
      overflow: 'hidden',
    }}>
      <AgeUnit value={years}  label="Years"  t={t} />
      <AgeUnit value={months} label="Months" t={t} />
      <AgeUnit value={days}   label="Days"   t={t} />
    </div>
  );
}
