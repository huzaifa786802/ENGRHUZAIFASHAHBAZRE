/**
 * AgeCalculator.jsx
 * Age Calculator — React.js Component (Premium Version)
 *
 * Author   : Your Name
 * Platform : Fiverr & Workchest
 *
 * ─── USAGE ──────────────────────────────────────────────────────────────────
 * import AgeCalculator from './AgeCalculator';
 * <AgeCalculator />
 *
 * ─── DEPENDENCIES ───────────────────────────────────────────────────────────
 * React 18+  (no other dependencies — pure React + inline styles)
 *
 * ─── CUSTOMISATION ──────────────────────────────────────────────────────────
 * Edit the THEME object below to change all colors in one place.
 */

import { useState, useEffect, useRef, useCallback } from 'react';

// ═══════════════════════════════════════════════════════════════════════════
// THEME — Edit colors here to match your brand
// ═══════════════════════════════════════════════════════════════════════════
const THEME = {
  dark: {
    bg:         '#0C0F14',
    surface:    '#13171F',
    surface2:   '#1A2030',
    border:     'rgba(255,255,255,0.07)',
    gold:       '#C9A84C',
    goldLight:  '#F0C96A',
    goldDim:    'rgba(201,168,76,0.15)',
    text:       '#E8E2D9',
    muted:      '#8A8F9A',
    white:      '#F5F0E8',
    red:        '#E05252',
  },
  light: {
    bg:         '#F5F1EB',
    surface:    '#FFFFFF',
    surface2:   '#F0EDE8',
    border:     'rgba(0,0,0,0.08)',
    gold:       '#A87830',
    goldLight:  '#A87830',
    goldDim:    'rgba(168,120,48,0.12)',
    text:       '#2C2620',
    muted:      '#7A7068',
    white:      '#1A1410',
    red:        '#CC3333',
  },
};

// ═══════════════════════════════════════════════════════════════════════════
// DATA — Zodiac, Birthstones, Generations
// ═══════════════════════════════════════════════════════════════════════════
const ZODIAC_SIGNS = [
  { name:'Capricorn',   icon:'♑', dates:'Dec 22 – Jan 19', check:(m,d)=>(m===12&&d>=22)||(m===1&&d<=19) },
  { name:'Aquarius',    icon:'♒', dates:'Jan 20 – Feb 18', check:(m,d)=>(m===1&&d>=20)||(m===2&&d<=18) },
  { name:'Pisces',      icon:'♓', dates:'Feb 19 – Mar 20', check:(m,d)=>(m===2&&d>=19)||(m===3&&d<=20) },
  { name:'Aries',       icon:'♈', dates:'Mar 21 – Apr 19', check:(m,d)=>(m===3&&d>=21)||(m===4&&d<=19) },
  { name:'Taurus',      icon:'♉', dates:'Apr 20 – May 20', check:(m,d)=>(m===4&&d>=20)||(m===5&&d<=20) },
  { name:'Gemini',      icon:'♊', dates:'May 21 – Jun 20', check:(m,d)=>(m===5&&d>=21)||(m===6&&d<=20) },
  { name:'Cancer',      icon:'♋', dates:'Jun 21 – Jul 22', check:(m,d)=>(m===6&&d>=21)||(m===7&&d<=22) },
  { name:'Leo',         icon:'♌', dates:'Jul 23 – Aug 22', check:(m,d)=>(m===7&&d>=23)||(m===8&&d<=22) },
  { name:'Virgo',       icon:'♍', dates:'Aug 23 – Sep 22', check:(m,d)=>(m===8&&d>=23)||(m===9&&d<=22) },
  { name:'Libra',       icon:'♎', dates:'Sep 23 – Oct 22', check:(m,d)=>(m===9&&d>=23)||(m===10&&d<=22) },
  { name:'Scorpio',     icon:'♏', dates:'Oct 23 – Nov 21', check:(m,d)=>(m===10&&d>=23)||(m===11&&d<=21) },
  { name:'Sagittarius', icon:'♐', dates:'Nov 22 – Dec 21', check:(m,d)=>(m===11&&d>=22)||(m===12&&d<=21) },
];

const BIRTHSTONES = [
  { name:'Garnet',     icon:'🔴', meaning:'Loyalty & Love' },
  { name:'Amethyst',   icon:'💜', meaning:'Calm & Clarity' },
  { name:'Aquamarine', icon:'🔵', meaning:'Courage & Serenity' },
  { name:'Diamond',    icon:'💎', meaning:'Strength & Invincibility' },
  { name:'Emerald',    icon:'💚', meaning:'Wisdom & Growth' },
  { name:'Pearl',      icon:'⚪', meaning:'Purity & Integrity' },
  { name:'Ruby',       icon:'❤️',  meaning:'Passion & Protection' },
  { name:'Peridot',    icon:'🟢', meaning:'Healing & Strength' },
  { name:'Sapphire',   icon:'🔷', meaning:'Truth & Sincerity' },
  { name:'Opal',       icon:'🌈', meaning:'Hope & Creativity' },
  { name:'Topaz',      icon:'🟡', meaning:'Abundance & Cheer' },
  { name:'Turquoise',  icon:'🩵', meaning:'Fortune & Success' },
];

const GENERATIONS = [
  { name:'Greatest Generation', range:'Before 1928',   from:0,    to:1927 },
  { name:'Silent Generation',   range:'1928 – 1945',   from:1928, to:1945 },
  { name:'Baby Boomer',         range:'1946 – 1964',   from:1946, to:1964 },
  { name:'Generation X',        range:'1965 – 1980',   from:1965, to:1980 },
  { name:'Millennial',          range:'1981 – 1996',   from:1981, to:1996 },
  { name:'Generation Z',        range:'1997 – 2012',   from:1997, to:2012 },
  { name:'Generation Alpha',    range:'2013 – present',from:2013, to:9999 },
];

// ═══════════════════════════════════════════════════════════════════════════
// PURE UTILITY FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════

/** Parse YYYY-MM-DD as local date (avoids UTC offset issues) */
function parseLocalDate(str) {
  const [y, m, d] = str.split('-').map(Number);
  return new Date(y, m - 1, d);
}

/** Format Date → YYYY-MM-DD */
function toDateStr(date) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

/** Exact age with leap-year and month-boundary handling */
function calcAge(dob, toDate) {
  let years  = toDate.getFullYear() - dob.getFullYear();
  let months = toDate.getMonth()    - dob.getMonth();
  let days   = toDate.getDate()     - dob.getDate();
  if (days < 0) {
    months--;
    days += new Date(toDate.getFullYear(), toDate.getMonth(), 0).getDate();
  }
  if (months < 0) { years--; months += 12; }
  return { years, months, days };
}

/** Get zodiac sign for a date */
function getZodiac(dob) {
  const m = dob.getMonth() + 1, d = dob.getDate();
  return ZODIAC_SIGNS.find(s => s.check(m, d)) || ZODIAC_SIGNS[0];
}

/** Format large numbers compactly */
function fmtBig(n) {
  if (n >= 1e9) return (n / 1e9).toFixed(1) + 'B';
  if (n >= 1e6) return (n / 1e6).toFixed(1) + 'M';
  return n.toLocaleString();
}

// ═══════════════════════════════════════════════════════════════════════════
// SUB-COMPONENTS
// ═══════════════════════════════════════════════════════════════════════════

/** Single age unit (Years / Months / Days) */
function AgeUnit({ value, label, t }) {
  return (
    <div style={{
      flex: 1, minWidth: 110, textAlign: 'center',
      padding: '24px 20px', position: 'relative',
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
        display: 'block', marginTop: 8,
        fontSize: '0.7rem', letterSpacing: '0.14em',
        textTransform: 'uppercase', color: t.muted, fontWeight: 500,
      }}>
        {label}
      </span>
    </div>
  );
}

/** Section divider */
function Divider({ label, t }) {
  return (
    <div style={{
      display: 'flex', alignItems: 'center', gap: 14,
      margin: '0 0 24px',
      fontSize: '0.72rem', letterSpacing: '0.12em',
      textTransform: 'uppercase', color: t.muted,
    }}>
      <span style={{ flex: 1, height: 1, background: t.border }} />
      {label}
      <span style={{ flex: 1, height: 1, background: t.border }} />
    </div>
  );
}

/** Life stat card */
function StatCard({ icon, value, label, t }) {
  return (
    <div style={{
      background: t.surface2, border: `1px solid ${t.border}`,
      borderRadius: 14, padding: '18px 20px',
    }}>
      <span style={{ fontSize: '1.2rem', display: 'block', marginBottom: 8 }}>{icon}</span>
      <span style={{
        fontFamily: 'Georgia, serif', fontSize: '1.45rem',
        fontWeight: 700, color: t.white, display: 'block', lineHeight: 1,
      }}>
        {value}
      </span>
      <span style={{
        fontSize: '0.68rem', color: t.muted,
        textTransform: 'uppercase', letterSpacing: '0.1em',
        marginTop: 5, display: 'block',
      }}>
        {label}
      </span>
    </div>
  );
}

/** Extra info card (Zodiac / Birthstone / Generation) */
function ExtraCard({ icon, title, value, sub, t }) {
  return (
    <div style={{
      background: t.surface2, border: `1px solid ${t.border}`,
      borderRadius: 14, padding: '18px 20px',
      display: 'flex', alignItems: 'center', gap: 14,
    }}>
      <span style={{ fontSize: '2rem', flexShrink: 0 }}>{icon}</span>
      <div>
        <span style={{ fontSize: '0.66rem', textTransform: 'uppercase', letterSpacing: '0.1em', color: t.muted, display: 'block' }}>{title}</span>
        <span style={{ fontSize: '1.05rem', fontWeight: 600, color: t.white, marginTop: 3, display: 'block' }}>{value}</span>
        <span style={{ fontSize: '0.73rem', color: t.muted, marginTop: 2, display: 'block' }}>{sub}</span>
      </div>
    </div>
  );
}

/** Live birthday countdown */
function Countdown({ dob, t }) {
  const [cd, setCd] = useState({ d:'00', h:'00', m:'00', s:'00', dateStr:'' });

  useEffect(() => {
    function tick() {
      const now = new Date();
      let next = new Date(now.getFullYear(), dob.getMonth(), dob.getDate());
      if (next <= now) next.setFullYear(now.getFullYear() + 1);
      const diff = next - now;
      const d = Math.floor(diff / 86400000);
      const h = Math.floor((diff % 86400000) / 3600000);
      const m = Math.floor((diff % 3600000) / 60000);
      const s = Math.floor((diff % 60000) / 1000);
      setCd({
        d: String(d).padStart(2,'0'),
        h: String(h).padStart(2,'0'),
        m: String(m).padStart(2,'0'),
        s: String(s).padStart(2,'0'),
        dateStr: next.toLocaleDateString('en-US', { weekday:'long', month:'long', day:'numeric', year:'numeric' }),
      });
    }
    tick();
    const id = setInterval(tick, 1000);
    return () => clearInterval(id);
  }, [dob]);

  const numStyle = {
    fontFamily: 'Georgia, serif', fontSize: '1.8rem',
    fontWeight: 700, color: t.goldLight, display: 'block', lineHeight: 1,
  };
  const lblStyle = { fontSize: '0.62rem', color: t.muted, letterSpacing: '0.1em', textTransform: 'uppercase' };
  const sepStyle = { fontSize: '1.5rem', color: t.gold, alignSelf: 'flex-start', marginTop: 4 };

  return (
    <div style={{
      background: `linear-gradient(135deg, ${t.goldDim}, transparent)`,
      border: `1px solid ${t.gold}44`,
      borderRadius: 16, padding: '22px 24px', marginBottom: 24,
      display: 'flex', alignItems: 'center', justifyContent: 'space-between',
      flexWrap: 'wrap', gap: 16,
    }}>
      <div>
        <div style={{ fontFamily:'Georgia,serif', fontSize:'1.05rem', color: t.gold, fontWeight: 700 }}>
          🎂 Next Birthday Countdown
        </div>
        <div style={{ fontSize:'0.78rem', color: t.muted, marginTop: 4 }}>{cd.dateStr}</div>
      </div>
      <div style={{ display:'flex', gap:10, alignItems:'flex-start' }}>
        {[['d','Days'],['h','Hrs'],['m','Min'],['s','Sec']].map(([key, lbl], i) => (
          <>
            {i > 0 && <span style={sepStyle}>:</span>}
            <div key={key} style={{ textAlign:'center' }}>
              <span style={numStyle}>{cd[key]}</span>
              <span style={lblStyle}>{lbl}</span>
            </div>
          </>
        ))}
      </div>
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════
// MAIN COMPONENT
// ═══════════════════════════════════════════════════════════════════════════

export default function AgeCalculator() {
  // ── State ────────────────────────────────────────────────────────────────
  const [darkMode, setDarkMode]     = useState(() => {
    try { return localStorage.getItem('ageCalcTheme') !== 'light'; }
    catch { return true; }
  });
  const [dob, setDob]               = useState('');
  const [calcDate, setCalcDate]     = useState(toDateStr(new Date()));
  const [error, setError]           = useState('');
  const [result, setResult]         = useState(null);  // null = not calculated yet
  const resultsRef                  = useRef(null);

  const t = darkMode ? THEME.dark : THEME.light;

  // Persist theme
  useEffect(() => {
    try { localStorage.setItem('ageCalcTheme', darkMode ? 'dark' : 'light'); }
    catch {}
  }, [darkMode]);

  // Max date for DOB input
  const todayStr = toDateStr(new Date());

  // ── Calculate handler ────────────────────────────────────────────────────
  const handleCalculate = useCallback(() => {
    setError('');
    if (!dob) { setError('Please enter your date of birth.'); return; }

    const dobDate    = parseLocalDate(dob);
    const toDateObj  = parseLocalDate(calcDate || todayStr);

    if (dobDate >= toDateObj) {
      setError('Date of birth must be before the "Calculate As Of" date.');
      return;
    }

    const { years, months, days } = calcAge(dobDate, toDateObj);
    const totalDays  = Math.floor((toDateObj - dobDate) / 86400000);
    const totalHours = totalDays * 24;
    const totalMins  = totalHours * 60;

    const zodiac     = getZodiac(dobDate);
    const stone      = BIRTHSTONES[dobDate.getMonth()];
    const gen        = GENERATIONS.find(g => dobDate.getFullYear() >= g.from && dobDate.getFullYear() <= g.to);

    setResult({
      years, months, days,
      totalDays,
      totalHours,
      totalMins,
      totalWeeks: Math.floor(totalDays / 7),
      heartbeats: Math.round(totalMins * 75),
      dayBorn: dobDate.toLocaleDateString('en-US', { weekday: 'long' }),
      zodiac,
      stone,
      gen: gen || GENERATIONS[0],
      dobDate,
    });

    setTimeout(() => {
      resultsRef.current?.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    }, 80);
  }, [dob, calcDate, todayStr]);

  // Allow Enter key to calculate
  const handleKeyDown = useCallback((e) => {
    if (e.key === 'Enter') handleCalculate();
  }, [handleCalculate]);

  // ── Styles ───────────────────────────────────────────────────────────────
  const wrapStyle = {
    minHeight: '100vh',
    background: t.bg,
    color: t.text,
    fontFamily: "'DM Sans', system-ui, sans-serif",
    transition: 'background 0.3s, color 0.3s',
    padding: '0 0 80px',
  };

  const innerStyle = {
    maxWidth: 860,
    margin: '0 auto',
    padding: '0 20px',
  };

  const cardStyle = {
    background: t.surface,
    border: `1px solid ${t.border}`,
    borderRadius: 20,
    padding: 'clamp(24px, 5vw, 44px)',
    boxShadow: darkMode
      ? '0 20px 60px rgba(0,0,0,0.5), 0 4px 16px rgba(0,0,0,0.3)'
      : '0 20px 60px rgba(0,0,0,0.09), 0 4px 16px rgba(0,0,0,0.06)',
  };

  const inputStyle = {
    width: '100%', padding: '13px 15px',
    background: t.surface2, color: t.text,
    border: `1.5px solid ${error ? t.red : t.border}`,
    borderRadius: 12, fontSize: '1rem',
    fontFamily: 'inherit', outline: 'none',
    boxSizing: 'border-box',
    transition: 'border-color 0.2s',
  };

  const btnStyle = {
    flexShrink: 0,
    padding: '13px 30px',
    background: `linear-gradient(135deg, ${t.gold}, #8B6420)`,
    color: '#1A1000',
    border: 'none', borderRadius: 12,
    fontFamily: 'inherit', fontSize: '0.95rem', fontWeight: 700,
    cursor: 'pointer', letterSpacing: '0.04em',
    boxShadow: `0 4px 20px ${t.goldDim}`,
    transition: 'transform 0.15s, box-shadow 0.15s',
    whiteSpace: 'nowrap',
  };

  const statsGridStyle = {
    display: 'grid',
    gridTemplateColumns: 'repeat(auto-fit, minmax(175px, 1fr))',
    gap: 14, marginBottom: 24,
  };

  const extrasGridStyle = {
    display: 'grid',
    gridTemplateColumns: 'repeat(auto-fit, minmax(210px, 1fr))',
    gap: 14,
  };

  // ── Render ───────────────────────────────────────────────────────────────
  return (
    <div style={wrapStyle}>
      <div style={innerStyle}>

        {/* ── Header ────────────────────────────────────────────────────── */}
        <header style={{
          display: 'flex', alignItems: 'center',
          justifyContent: 'space-between',
          padding: '20px 0 48px',
        }}>
          <span style={{
            fontFamily: 'Georgia, serif',
            fontSize: '1.1rem', letterSpacing: '0.1em',
            color: t.gold, textTransform: 'uppercase',
          }}>
            AgeCalc ✦
          </span>

          {/* Theme Toggle */}
          <button
            onClick={() => setDarkMode(d => !d)}
            aria-label="Toggle theme"
            title={darkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
            style={{
              width: 44, height: 26, borderRadius: 13,
              background: t.surface2, border: `1.5px solid ${t.border}`,
              cursor: 'pointer', position: 'relative',
              transition: 'background 0.3s',
            }}
          >
            <span style={{
              position: 'absolute', top: 3,
              left: darkMode ? 3 : 19,
              width: 18, height: 18, borderRadius: '50%',
              background: t.gold,
              transition: 'left 0.3s',
              display: 'block',
            }} />
          </button>
        </header>

        {/* ── Hero ──────────────────────────────────────────────────────── */}
        <div style={{ textAlign: 'center', marginBottom: 52 }}>
          <h1 style={{
            fontFamily: 'Georgia, serif',
            fontSize: 'clamp(2.2rem, 6vw, 3.8rem)',
            fontWeight: 900, lineHeight: 1.1,
            color: t.white, margin: 0,
          }}>
            Know your{' '}
            <span style={{ color: t.gold }}>age</span>,
            <br />know your story.
          </h1>
          <p style={{
            marginTop: 14, fontSize: '1rem',
            color: t.muted, fontWeight: 300,
            letterSpacing: '0.02em',
          }}>
            Enter your date of birth and discover the full picture of your life in numbers.
          </p>
        </div>

        {/* ── Main Card ─────────────────────────────────────────────────── */}
        <div style={cardStyle}>

          {/* Input row */}
          <div style={{
            display: 'flex', gap: 14, alignItems: 'flex-end',
            flexWrap: 'wrap', marginBottom: error ? 8 : 32,
          }}>
            <div style={{ flex: 1, minWidth: 140 }}>
              <label style={{
                display: 'block', fontSize: '0.68rem',
                letterSpacing: '0.12em', textTransform: 'uppercase',
                color: t.muted, marginBottom: 8, fontWeight: 500,
              }}>
                Date of Birth
              </label>
              <input
                type="date"
                value={dob}
                max={todayStr}
                onChange={e => { setDob(e.target.value); setError(''); }}
                onKeyDown={handleKeyDown}
                style={inputStyle}
              />
            </div>
            <div style={{ flex: 1, minWidth: 140, maxWidth: 200 }}>
              <label style={{
                display: 'block', fontSize: '0.68rem',
                letterSpacing: '0.12em', textTransform: 'uppercase',
                color: t.muted, marginBottom: 8, fontWeight: 500,
              }}>
                Calculate As Of
              </label>
              <input
                type="date"
                value={calcDate}
                onChange={e => setCalcDate(e.target.value)}
                style={inputStyle}
              />
            </div>
            <button
              onClick={handleCalculate}
              style={btnStyle}
              onMouseEnter={e => {
                e.target.style.transform = 'translateY(-2px)';
                e.target.style.boxShadow = `0 8px 28px ${t.goldDim}`;
              }}
              onMouseLeave={e => {
                e.target.style.transform = 'translateY(0)';
                e.target.style.boxShadow = `0 4px 20px ${t.goldDim}`;
              }}
            >
              Calculate →
            </button>
          </div>

          {/* Error */}
          {error && (
            <p style={{
              color: t.red, fontSize: '0.82rem',
              marginBottom: 24, marginTop: 4,
            }}>
              {error}
            </p>
          )}

          {/* ── Results ───────────────────────────────────────────────── */}
          {result && (
            <div ref={resultsRef}>

              {/* Primary Age */}
              <Divider label="Your Age" t={t} />
              <div style={{
                display: 'flex', flexWrap: 'wrap',
                marginBottom: 32,
                borderRadius: 16,
                border: `1px solid ${t.border}`,
                overflow: 'hidden',
              }}>
                {[
                  { value: result.years,  label: 'Years' },
                  { value: result.months, label: 'Months' },
                  { value: result.days,   label: 'Days' },
                ].map((u, i) => (
                  <AgeUnit key={u.label} value={u.value} label={u.label} t={t} />
                ))}
              </div>

              {/* Life in Numbers */}
              <Divider label="Life in Numbers" t={t} />
              <div style={statsGridStyle}>
                <StatCard icon="📅" value={result.totalDays.toLocaleString()}   label="Total Days Lived"    t={t} />
                <StatCard icon="⏰" value={result.totalHours.toLocaleString()}  label="Total Hours Lived"   t={t} />
                <StatCard icon="⚡" value={result.totalMins.toLocaleString()}   label="Total Minutes Lived" t={t} />
                <StatCard icon="💓" value={fmtBig(result.heartbeats)}           label="Est. Heartbeats"     t={t} />
                <StatCard icon="🌙" value={result.totalWeeks.toLocaleString()}  label="Total Weeks"         t={t} />
                <StatCard icon="🌟" value={result.dayBorn}                      label="Day You Were Born"   t={t} />
              </div>

              {/* Birthday Countdown */}
              <Countdown dob={result.dobDate} t={t} />

              {/* Extras */}
              <div style={extrasGridStyle}>
                <ExtraCard
                  icon={result.zodiac.icon}
                  title="Zodiac Sign"
                  value={result.zodiac.name}
                  sub={result.zodiac.dates}
                  t={t}
                />
                <ExtraCard
                  icon={result.stone.icon}
                  title="Birth Stone"
                  value={result.stone.name}
                  sub={result.stone.meaning}
                  t={t}
                />
                <ExtraCard
                  icon="🌏"
                  title="Generation"
                  value={result.gen.name}
                  sub={result.gen.range}
                  t={t}
                />
              </div>
            </div>
          )}
        </div>

        {/* ── Footer ────────────────────────────────────────────────────── */}
        <footer style={{
          textAlign: 'center', marginTop: 60,
          fontSize: '0.78rem', color: t.muted,
        }}>
          Built with ♥ by{' '}
          <a href="#" style={{ color: t.gold, textDecoration: 'none' }}>Your Name</a>
          {' · '}
          <a href="#" style={{ color: t.gold, textDecoration: 'none' }}>Fiverr</a>
          {' & '}
          <a href="#" style={{ color: t.gold, textDecoration: 'none' }}>Workchest</a>
        </footer>

      </div>
    </div>
  );
}
