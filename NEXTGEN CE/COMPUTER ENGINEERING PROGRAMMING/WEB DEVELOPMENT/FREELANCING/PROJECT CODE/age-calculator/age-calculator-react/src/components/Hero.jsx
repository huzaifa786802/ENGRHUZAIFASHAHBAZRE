/**
 * Hero.jsx — Title and tagline section
 */

export default function Hero({ t }) {
  return (
    <div style={{ textAlign: 'center', marginBottom: 52 }}>
      <h1 style={{
        fontFamily: 'Georgia, serif',
        fontSize: 'clamp(2.2rem, 6vw, 3.8rem)',
        fontWeight: 900,
        lineHeight: 1.1,
        color: t.white,
        margin: 0,
      }}>
        Know your{' '}
        <span style={{ color: t.gold }}>age</span>,
        <br />
        know your story.
      </h1>
      <p style={{
        marginTop: 14,
        fontSize: '1rem',
        color: t.muted,
        fontWeight: 300,
        letterSpacing: '0.02em',
      }}>
        Enter your date of birth and discover the full picture of your life in numbers.
      </p>
    </div>
  );
}
