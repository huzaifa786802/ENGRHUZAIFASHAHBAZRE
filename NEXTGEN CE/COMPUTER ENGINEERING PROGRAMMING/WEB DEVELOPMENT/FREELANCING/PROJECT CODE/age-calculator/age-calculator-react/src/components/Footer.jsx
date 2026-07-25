/**
 * Footer.jsx — App footer with branding links
 */

export default function Footer({ t }) {
  const linkStyle = { color: t.gold, textDecoration: 'none' };

  return (
    <footer style={{
      textAlign: 'center',
      marginTop: 60,
      fontSize: '0.78rem',
      color: t.muted,
    }}>
      Built with ♥ by{' '}
      <a href="#" style={linkStyle}>Your Name</a>
      {' · '}
      <a href="https://fiverr.com/yourprofile" style={linkStyle}>Fiverr</a>
      {' & '}
      <a href="https://workchest.com/yourprofile" style={linkStyle}>Workchest</a>
    </footer>
  );
}
