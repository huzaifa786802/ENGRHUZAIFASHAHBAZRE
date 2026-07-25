/**
 * DateForm.jsx — Date of birth input, "Calculate As Of" input, and Calculate button
 */

export default function DateForm({
  dob, setDob,
  calcDate, setCalcDate,
  todayStr,
  error,
  onCalculate,
  onKeyDown,
  t,
}) {
  const labelStyle = {
    display: 'block',
    fontSize: '0.68rem',
    letterSpacing: '0.12em',
    textTransform: 'uppercase',
    color: t.muted,
    marginBottom: 8,
    fontWeight: 500,
  };

  const inputStyle = {
    width: '100%',
    padding: '13px 15px',
    background: t.surface2,
    color: t.text,
    border: `1.5px solid ${error ? t.red : t.border}`,
    borderRadius: 12,
    fontSize: '1rem',
    fontFamily: 'inherit',
    outline: 'none',
    boxSizing: 'border-box',
    transition: 'border-color 0.2s',
  };

  const btnStyle = {
    flexShrink: 0,
    padding: '13px 30px',
    background: `linear-gradient(135deg, ${t.gold}, #8B6420)`,
    color: '#1A1000',
    border: 'none',
    borderRadius: 12,
    fontFamily: 'inherit',
    fontSize: '0.95rem',
    fontWeight: 700,
    cursor: 'pointer',
    letterSpacing: '0.04em',
    boxShadow: `0 4px 20px ${t.goldDim}`,
    transition: 'transform 0.15s, box-shadow 0.15s',
    whiteSpace: 'nowrap',
  };

  return (
    <>
      <div style={{
        display: 'flex',
        gap: 14,
        alignItems: 'flex-end',
        flexWrap: 'wrap',
        marginBottom: error ? 8 : 32,
      }}>
        {/* Date of Birth */}
        <div style={{ flex: 1, minWidth: 140 }}>
          <label style={labelStyle} htmlFor="dob">Date of Birth</label>
          <input
            id="dob"
            type="date"
            value={dob}
            max={todayStr}
            onChange={e => setDob(e.target.value)}
            onKeyDown={onKeyDown}
            style={inputStyle}
          />
        </div>

        {/* Calculate As Of */}
        <div style={{ flex: 1, minWidth: 140, maxWidth: 200 }}>
          <label style={labelStyle} htmlFor="calcDate">Calculate As Of</label>
          <input
            id="calcDate"
            type="date"
            value={calcDate}
            onChange={e => setCalcDate(e.target.value)}
            style={inputStyle}
          />
        </div>

        {/* Submit Button */}
        <button
          onClick={onCalculate}
          style={btnStyle}
          onMouseEnter={e => {
            e.currentTarget.style.transform = 'translateY(-2px)';
            e.currentTarget.style.boxShadow = `0 8px 28px ${t.goldDim}`;
          }}
          onMouseLeave={e => {
            e.currentTarget.style.transform = 'translateY(0)';
            e.currentTarget.style.boxShadow = `0 4px 20px ${t.goldDim}`;
          }}
        >
          Calculate →
        </button>
      </div>

      {/* Error Message */}
      {error && (
        <p style={{
          color: t.red,
          fontSize: '0.82rem',
          marginTop: 0,
          marginBottom: 24,
        }}>
          {error}
        </p>
      )}
    </>
  );
}
