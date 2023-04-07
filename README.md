# @fausto95/react-native-marketingcloud-sdk

Salesforce Marketing Cloud SDK for React Native

It uses Turbo Modules for new arch and Native Modules for old arch.

## Installation

```sh
npm install @fausto95/react-native-marketingcloud-sdk
```

```sh
yarn add @fausto95/react-native-marketingcloud-sdk
```

## Usage

```js
import * as RNMCSDK from '@fausto95/react-native-marketingcloud-sdk';

// ...

RNMCSDK.setContactKey('ANROKSORZ');
```

## Methods

```ts
  isPushEnabled(): Promise<boolean>;
  enablePush(): void;
  disablePush(): void;
  getSystemToken(): Promise<string | null>;
  getAttributes(): Record<string, string>;
  setAttribute<T>(key: string, value: T): void;
  clearAttribute(key: string): void;
  addTag(tag: string): void;
  removeTag(tag: string): void;
  getTags(): Promise<Array<string>>;
  setContactKey(contactKey: string): void;
  getContactKey(): Promise<string | null>;
  enableVerboseLogging(): void;
  disableVerboseLogging(): void;
  logSdkState(): void;
  track(name: string, attributes: Record<string, string>): void;
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
