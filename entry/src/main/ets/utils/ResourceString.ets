export function getResourceString(resource: Resource, __this: object): string {
  let resourceString = getContext(__this).resourceManager.getStringSync(resource.id);
  return resourceString;
}