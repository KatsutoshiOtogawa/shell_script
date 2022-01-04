// @ts-check

/**
 * launch invoke function.
 * @param {Object} firedClass
 */
export function NodeFire(firedClass) {
  const fired_class = new firedClass
  fired_class.invoke();
}
