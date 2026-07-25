/**
 * ExtrasRow.jsx — Three extra info cards: Zodiac, Birthstone, Generation
 */

function ExtraCard({ icon, title, value, sub, t }) {
  return (
    <div style={{
      background: t.surface2,
      border: `1px solid ${t.border}`,
      borderRadius: 14,
      padding: '18px 20px',
      display: 'flex',
      alignItems: 'center',
      gap: 14,
    }}>
      <span style={{ fontSize: '2rem', flexShrink: 0 }}>{icon}</span>
      <div>
        <span style={{
          fontSize: '0.66rem',
          textTransform: 'uppercase',
          letterSpacing: '0.1em',
          color: t.muted,
          display: 'block',
        }}>
          {title}
        </span>
        <span style={{
          fontSize: '1.05rem',
          fontWeight: 600,
          color: t.white,
          marginTop: 3,
          display: 'block',
        }}>
          {value}
        </span>
        <span style={{
          fontSize: '0.73rem',
          color: t.muted,
          marginTop: 2,
          display: 'block',
        }}>
          {sub}
        </span>
      </div>
    </div>
  );
}

export default function ExtrasRow({ zodiac, stone, generation, t }) {
  return (
    <div style={{
      display: 'grid',
      gridTemplateColumns: 'repeat(auto-fit, minmax(210px, 1fr))',
      gap: 14,
    }}>
      <ExtraCard
        icon={zodiac.icon}
        title="Zodiac Sign"
        value={zodiac.name}
        sub={zodiac.dates}
        t={t}
      />
      <ExtraCard
        icon={stone.icon}
        title="Birth Stone"
        value={stone.name}
        sub={stone.meaning}
        t={t}
      />
      <ExtraCard
        icon="🌏"
        title="Generation"
        value={generation.name}
        sub={generation.range}
        t={t}
      />
    </div>
  );
}
