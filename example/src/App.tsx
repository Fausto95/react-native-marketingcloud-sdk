import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import * as LIB from '@fausto95/react-native-marketingcloud-sdk';

export default function App() {
  React.useEffect(() => {
    LIB.setContactKey('0031l00000u9zHXAAY');
  }, []);
  return (
    <View style={styles.container}>
      <Text>Result: </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
