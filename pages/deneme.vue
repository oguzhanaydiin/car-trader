<template>
  <div>
    <button @click="toggleOpen">{{ isOpen ? 'Close' : 'Open' }}</button>
    
    <div v-if="isOpen">
      <p>Data: {{ data }}</p>
      <button @click="fetchData">Fetch Data</button>
    </div>
  </div>
</template>

<script setup>
import { storeToRefs } from 'pinia'
import { useMyStore } from '~/stores/myStore'

// Get the store
const store = useMyStore()

// Destructure the reactive values using `storeToRefs` to ensure reactivity in template
const { isOpen, data } = storeToRefs(store)

// Get the actions
const { toggleOpen, fetchData } = store
</script>
