/**
 * StatsGrid.jsx — 6-card grid showing life stats
 * (total days, hours, minutes, heartbeats, weeks, day born)
 */

import { fmtBig } from '../utils/dateUtils';

function StatCard({ icon, value, label, t }) {
  return (
    <div style={{
      background: t.surface2,
      border: `1px solid ${t.border}`,
      borderRadius: 14,
      padding: '18px 20px',
    }}>
      <span style={{ fontSize: '1.2rem', display: 'block', marginBottom: 8 }}>
        {icon}
      </span>
      <span style={{
        fontFamily: 'Georgia, serif',
        fontSize: '1.45rem',
        fontWeight: 700,
        color: t.white,
        display: 'block',
        lineHeight: 1,
      }}>
        {value}
      </span>
      <span style={{
        fontSize: '0.68rem',
        color: t.muted,
        textTransform: 'uppercase',
        letterSpacing: '0.1em',
        marginTop: 5,
        display: 'block',
      }}>
        {label}
      </span>
    </div>
  );
}

export default function StatsGrid({ totalDays, totalHours, totalMins, totalWeeks, heartbeats, dayBorn, t }) {
  const stats = [
    { icon: '📅', value: totalDays.toLocaleString(),  label: 'Total Days Lived' },
    { icon: '⏰', value: totalHours.toLocaleString(), label: 'Total Hours Lived' },
    { icon: '⚡', value: totalMins.toLocaleString(),  label: 'Total Minutes Lived' },
    { icon: '💓', value: fmtBig(heartbeats),          label: 'Est. Heartbeats' },
    { icon: '🌙', value: totalWeeks.toLocaleString(), label: 'Total Weeks' },
    { icon: '🌟', value: dayBorn,                     label: 'Day You Were Born' },
  ];

  return (
    <div style={{
      display: 'grid',
      gridTemplateColumns: 'repeat(auto-fit, minmax(175px, 1fr))',
      gap: 14,
      marginBottom: 24,
    }}>
      {stats.map(s => (
        <StatCard key={s.label} icon={s.icon} value={s.value} label={s.label} t={t} />
      ))}
    </div>
  );
}
