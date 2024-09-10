import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useMyStore = defineStore('myStore', () => {
  // State
  const data = ref(null)
  const isOpen = ref(false)

  // Fetch data from our custom API
  const fetchData = async () => {
    try {
      const { data: fetchedData } = await useFetch('/api/data') // Fetch from the custom API
      data.value = fetchedData.value // Adjust for reactive `value` structure in Pinia store
    } catch (error) {
      console.error('Error fetching data:', error)
    }
  }

  const toggleOpen = () => {
    isOpen.value = !isOpen.value
  }

  return { data, isOpen, fetchData, toggleOpen }
})
