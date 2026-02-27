double getViewportFraction(double width) {
  if (width < 360) return 0.74; // small phones
  if (width < 600) return 0.59; // normal phones
  if (width < 900) return 0.44; // tablets
  return 0.25; // large screens
}

double getEnlargeFactor(double width) {
  if (width < 360) return 0.25;
  if (width < 600) return 0.35;
  return 0.18;
}