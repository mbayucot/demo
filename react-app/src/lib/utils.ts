// eslint-disable-next-line @typescript-eslint/ban-types
export const enumKeys = <O extends object, K extends keyof O = keyof O>(
  obj: O
): K[] => {
  return Object.keys(obj).filter((k) => Number.isNaN(+k)) as K[];
};
