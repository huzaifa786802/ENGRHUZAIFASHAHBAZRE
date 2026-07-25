/**
 * Header.jsx — App header with logo and dark/light mode toggle
 */

export default function Header({ isDark, toggleTheme, t }) {
  return (
    <header style={{
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      padding: '20px 0 48px',
    }}>
      {/* Logo */}
      <span style={{
        fontFamily: 'Georgia, serif',
        fontSize: '1.1rem',
        letterSpacing: '0.1em',
        color: t.gold,
        textTransform: 'uppercase',
      }}>
        AgeCalc ✦
      </span>

      {/* Theme Toggle Button */}
      <button
        onClick={toggleTheme}
        aria-label={isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
        title={isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
        style={{
          width: 44, height: 26, borderRadius: 13,
          background: t.surface2,
          border: `1.5px solid ${t.border}`,
          cursor: 'pointer',
          position: 'relative',
          transition: 'background 0.3s',
        }}
      >
        <span style={{
          position: 'absolute',
          top: 3,
          left: isDark ? 3 : 19,
          width: 18, height: 18,
          borderRadius: '50%',
          background: t.gold,
          transition: 'left 0.3s ease',
          display: 'block',
        }} />
      </button>
    </header>
  );
}
