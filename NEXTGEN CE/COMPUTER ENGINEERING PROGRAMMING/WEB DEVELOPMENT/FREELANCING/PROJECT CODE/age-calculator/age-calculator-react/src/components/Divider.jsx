/**
 * Divider.jsx — Horizontal section divider with centred label
 */

export default function Divider({ label, t }) {
  return (
    <div style={{
      display: 'flex',
      alignItems: 'center',
      gap: 14,
      margin: '0 0 24px',
      fontSize: '0.72rem',
      letterSpacing: '0.12em',
      textTransform: 'uppercase',
      color: t.muted,
    }}>
      <span style={{ flex: 1, height: 1, background: t.border }} />
      {label}
      <span style={{ flex: 1, height: 1, background: t.border }} />
    </div>
  );
}
